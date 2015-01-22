//
//  _MyMutableDictionaryBucket.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "_MyMutableDictionaryBucket.h"

@implementation _MyMutableDictionaryBucket

- (void)dealloc {
  [_key release];
  [_obj release];
  [_next release];
  [super dealloc];
}

@end
