//
//  NSMutableArray+Benchmark.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^BenchmarkCompletionHandler) (uint64 time);

@interface NSMutableArray (Benchmark)
+ (void)testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testDeletingFirstElementWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testInsertionAtBeginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testAllocationWithCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
@end
