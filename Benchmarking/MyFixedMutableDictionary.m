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

@end
