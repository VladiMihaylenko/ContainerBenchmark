//
//  NSMutableDictionary+Benchmark.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "NSMutableDictionary+Benchmark.h"

FOUNDATION_EXTERN uint64_t dispatch_benchmark(size_t count, void (^block)(void));
FOUNDATION_EXTERN const size_t iterations;

@implementation NSMutableDictionary (Benchmark)

+ (void)testDeletingWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableDictionary *dictionary = _mutableDictionaryWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            id key = dictionary.allKeys[rand()%dictionary.allKeys.count];
            [dictionary removeObjectForKey:key];
        }
    });
    completion(t_0);
}

+ (void)testInsertWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableDictionary *dictionary = _mutableDictionaryWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            id key = [NSString stringWithFormat:@"%@", @(rand())];
            id obj = @1;
            [dictionary setObject:obj forKey:key];
        }
    });
    completion(t_0);
}

+ (void)testSearchWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableDictionary *dictionary = _mutableDictionaryWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            id key = [NSString stringWithFormat:@"%@", @(rand()%capacity)];
            [dictionary objectForKey:key];
        }
    });
    completion(t_0);
}

NSMutableDictionary* _mutableDictionaryWithCapacity(int capacity) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (int i = 0; i != capacity; ++i) {
        id key = [NSString stringWithFormat:@"%@", @(i)];
        id object = @(i);
        [dictionary setObject:object forKey:key];
    }
    return dictionary;
}


@end
