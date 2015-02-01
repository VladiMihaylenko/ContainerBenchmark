//
//  MyMutableArray+Benchmark.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyMutableArray+Benchmark.h"

FOUNDATION_EXTERN uint64_t dispatch_benchmark(size_t count, void (^block)(void));
FOUNDATION_EXTERN const size_t iterations;

@implementation MyMutableArray (Benchmark)

+ (void)testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        [array removeLastObject];
    });
    completion(t_0);
}

+ (void)testDeletingFirstElementWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        [array removeObjectAtIndex:0];
    });
    completion(t_0);
}


+ (void)testAllocationWithCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSMutableArray *array = _myMutableArrayWithCapacity(capacity);
        }
    });
    completion(t_0);
}

+ (void)testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        NSUInteger index = rand()%capacity;
        [array removeObjectAtIndex:index];
    });
    completion(t_0);
}

+ (void)testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [array addObject:num];
    });
    completion(t_0);
}

+ (void)testInsertionAtBeginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [array insertObject:num atIndex:0];
    });
    completion(t_0);
}

+ (void)testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSUInteger index = array.count-1;
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [array objectAtIndex:index];
    });
    completion(t_0);
    
}

+ (void)testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSNumber *num = array[array.count-1];
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [array indexOfObject:num];
    });
    completion(t_0);
}

MyMutableArray* _myMutableArrayWithCapacity(int capacity) {
    MyMutableArray *array = [MyMutableArray array];
    for (int i = 0; i != capacity; ++i) {
        [array addObject:@(i)];
    }
    return array;
}

@end
