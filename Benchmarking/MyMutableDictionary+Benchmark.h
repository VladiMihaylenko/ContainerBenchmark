//
//  MyMutableDictionary+Benchmark.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyMutableDictionary.h"

typedef void (^BenchmarkCompletionHandler) (uint64 time);
@interface MyMutableDictionary (Benchmark)

+ (void)testDeletingWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testInsertWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testSearchWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;

@end
