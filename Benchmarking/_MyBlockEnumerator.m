//
//  _MyBlockEnumerator.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "_MyBlockEnumerator.h"

@implementation _MyBlockEnumerator

- (instancetype)initWithBlock:(MyEnumeratorBlock)block {
  self = [super init];
  if (self) {
    _block = [block copy];
  }
  return self;
}

- (void)dealloc {
  [_block release];
  [super dealloc];
}

- (id)nextObject {
  return _block();
}

@end
