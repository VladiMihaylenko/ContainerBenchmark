//
//  DictionaryBenchmarker.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "DictionaryBenchmarker.h"
#import "MyMutableDictionary.h"
#import "MyMutableDictionary+Benchmark.h"
#import "NSMutableDictionary+Benchmark.h"

@implementation DictionaryBenchmarker

+ (void)runBenchmarkingForClass:(Class)class {
    NSLog(@"Benchmarking for class: %@", class);
    @autoreleasepool {
       const NSArray *capacity = @[@1000, @10000, @100000, @300000, @800000, @1000000];
        NSMutableArray *deletingTimes = [NSMutableArray array];
        NSMutableArray *insertTimes = [NSMutableArray array];
        NSMutableArray *searchTimes = [NSMutableArray array];
       
        for (NSNumber *num in capacity) {
            NSLog(@"CAPACITY : %@", num);
            [class testDeletingWithDictionaryCapacity :num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Deleting, time: %@", class, @(time));
                [deletingTimes addObject:@(time)];
            }];
            
            [class testInsertWithDictionaryCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Insert, time: %@", class, @(time));
                [insertTimes addObject:@(time)];
            }];
            
            [class testSearchWithDictionaryCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Search, time: %@", class, @(time));
                [searchTimes addObject:@(time)];
            }];
        }
        NSLog(@"Deleting times :%@", deletingTimes);
        NSLog(@"Insert times: %@", insertTimes);
        NSLog(@"Search times: %@", searchTimes);
    }
}

+ (void)benchmarkCustomMutableDictionary {
    [[self class] runBenchmarkingForClass:[MyMutableDictionary class]];
}

+ (void)benchmarkNSMutableDictionary {
    [[self class] runBenchmarkingForClass:[NSMutableDictionary class]];
}

@end
