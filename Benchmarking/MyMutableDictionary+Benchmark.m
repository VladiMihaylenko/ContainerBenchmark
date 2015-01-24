//
//  MyMutableDictionary+Benchmark.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyMutableDictionary+Benchmark.h"

FOUNDATION_EXTERN uint64_t dispatch_benchmark(size_t count, void (^block)(void));
FOUNDATION_EXTERN const size_t iterations;


@implementation MyMutableDictionary (Benchmark)

+ (void)testDeletingWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableDictionary *dictionary = _myMutableDictionaryWithCapacity(capacity);
    NSArray *keys = dictionary.allKeys;
    id key = keys[rand()%keys.count];
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [dictionary removeObjectForKey:key];
    });
    completion(t_0);
}

+ (void)testInsertWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableDictionary *dictionary = _myMutableDictionaryWithCapacity(capacity);
    NSMutableArray *keys = [NSMutableArray array];
    for (size_t i = 0; i != capacity; ++i) {
        keys[i] = [NSString stringWithFormat:@"%@", @(rand())];
    }
    const id obj = @1;
    id key = keys[rand()%keys.count];
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [dictionary setObject:obj forKey:key];
    });
    completion(t_0);
}

+ (void)testSearchWithDictionaryCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableDictionary *dictionary = _myMutableDictionaryWithCapacity(capacity);
    NSMutableArray *keys = [NSMutableArray array];
    for (size_t i = 0; i != capacity; ++i) {
        keys[i] = [NSString stringWithFormat:@"%@", @(rand()%capacity)];
    }
    id key = keys[rand()%capacity];
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        [dictionary objectForKey:key];
    });
    completion(t_0);
}

MyMutableDictionary* _myMutableDictionaryWithCapacity(int capacity) {
    MyMutableDictionary *dictionary = [MyMutableDictionary dictionary];
    for (int i = 0; i != capacity; ++i) {
        id key = [NSString stringWithFormat:@"%@", @(i)];
        id object = @(i);
        [dictionary setObject:object forKey:key];
    }
    return dictionary;
}


@end
