//
//  MyMutableDictionary.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyMutableDictionary.h"
#import "MyFixedMutableDictionary.h"

static const NSUInteger kMaxLoadFactorNumerator = 7;
static const NSUInteger kMaxLoadFactorDenominator = 10;

@implementation MyMutableDictionary {
    NSUInteger _size;
    MyFixedMutableDictionary *_fixedDict;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    const NSUInteger kArbitraryMinimun = 4;
    numItems = MAX(numItems, kArbitraryMinimun);
    self = [super init];
    if (self) {
        _size = numItems;
        _fixedDict = [[MyFixedMutableDictionary alloc] initWithSize:_size];
    }
    return self;
}

- (void)dealloc {
    [_fixedDict release];
    [super dealloc];
}

- (NSUInteger)count {
    return [_fixedDict count];
}

- (id)objectForKey:(id)aKey {
    return [_fixedDict objectForKey:aKey];
}

- (NSEnumerator*)keyEnumerator {
    return [_fixedDict keyEnumerator];
}

- (void)removeObjectForKey:(id)aKey {
    [_fixedDict removeObjectForKey:aKey];
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    [_fixedDict setObject:anObject forKey:aKey];
    if (kMaxLoadFactorDenominator * _fixedDict.count / _size > kMaxLoadFactorNumerator) {
        NSUInteger newSize = _size * 2;
        MyFixedMutableDictionary *newDict = [[MyFixedMutableDictionary alloc] initWithSize:newSize];
        for (id key in _fixedDict)
            [newDict setObject:[_fixedDict objectForKey:key] forKey:key];
        [_fixedDict release];
        _size = newSize;
        _fixedDict = newDict;
    }
}



@end
