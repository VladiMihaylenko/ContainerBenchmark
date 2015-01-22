//
//  MyFixedMutableDictionary.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyFixedMutableDictionary.h"
#import "_MyBlockEnumerator.h"
#import "_MyMutableDictionaryBucket.h"

@implementation MyFixedMutableDictionary {
    NSUInteger _count;
    NSUInteger _size;
    _MyMutableDictionaryBucket **_array;
}

- (instancetype)initWithSize:(NSUInteger)size {
    self = [super init];
    if (self) {
        _size = size;
        _array = calloc(size, sizeof(*_array));
    }
    return self;
}

- (void)dealloc {
    for (NSUInteger i = 0; i < _size; i++)
    [_array[i] release];
    free(_array);
    [super dealloc];
}

- (NSUInteger)count {
    return _count;
}

- (id)objectForKey:(id)aKey {
    NSUInteger bucketIndex = [aKey hash] % _size;
    _MyMutableDictionaryBucket *bucket = _array[bucketIndex];
    while (bucket) {
    if ([bucket.key isEqual:aKey]) {
      return bucket.obj;
    }
    bucket = [bucket next];
    }
    return nil;
}

- (NSEnumerator *)keyEnumerator {
    __block NSUInteger index = -1;
    __block _MyMutableDictionaryBucket *bucket = nil;
    NSEnumerator *e = [[_MyBlockEnumerator alloc] initWithBlock:^id{
        bucket = [bucket next];
        while (bucket) {
            index++;
            if (index >= _size) {
                return nil;
            }
            bucket = _array[index];
        }
        return [bucket key];
    }];
    return [e autorelease];
}

- (void)removeObjectForKey:(id)aKey {
    NSUInteger bucketIndex = [aKey hash] % _size;
    _MyMutableDictionaryBucket *previousBucket = nil;
    _MyMutableDictionaryBucket *bucket = _array[bucketIndex];
    while (bucket) {
        if ([bucket.key isEqual:aKey]) {
            if (previousBucket == nil) {
                _MyMutableDictionaryBucket *nextBucket = bucket.next.retain;
                [_array[bucketIndex] release];
                _array[bucketIndex] = nextBucket;
            
            } else {
                previousBucket.next = bucket.next;
            }
            _count--;
            return;
        }
        previousBucket = bucket;
        bucket = bucket.next;
    }
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    _MyMutableDictionaryBucket *newBucket = [[_MyMutableDictionaryBucket alloc] init];
    newBucket.key = aKey;
    newBucket.obj = anObject;
    [self removeObjectForKey:aKey];
    NSUInteger bucketIndex = [aKey hash] % _size;
    newBucket.next = _array[bucketIndex];
    [_array[bucketIndex] release];
    _array[bucketIndex] = newBucket;
    _count++;
    
}

@end
