//
//  ArrayBenchmarker.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "ArrayBenchmarker.h"
#import "NSMutableArray+Benchmark.h"
#import "MyMutableArray+Benchmark.h"
#import "MyMutableArray.h"

@implementation ArrayBenchmarker

+ (void)runBenchmarkingForClass:(Class)class {
    NSLog(@"Benchmarking for class: %@", class);
    @autoreleasepool {
       const NSArray *capacity = @[@1000, @10000, @100000, @300000, @800000, @1000000];
        NSMutableArray *insertAtBeginTimes = [NSMutableArray array];
        NSMutableArray *insertAtEndTimes = [NSMutableArray array];
        NSMutableArray *randomRemoveTimes = [NSMutableArray array];
        NSMutableArray *removeAtEndTimes = [NSMutableArray array];
        NSMutableArray *indexOfObjectTimes = [NSMutableArray array];
        NSMutableArray *objectAtIndexTimes = [NSMutableArray array];
        NSMutableArray *removeFirst = [NSMutableArray array];
        NSMutableArray *allocations = [NSMutableArray array];
       
        for (NSNumber *num in capacity) {
            NSLog(@"CAPACITY : %@", num);
            [class testInsertionAtBeginWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Insert at beginning, time: %@", class, @(time));
                [insertAtBeginTimes addObject:@(time)];
            }];
            
            [class testInsertionAtEndWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Insert at end, time: %@", class, @(time));
                [insertAtEndTimes addObject:@(time)];
            }];
            
            [class testIndexOfObjectWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Search by value, time: %@", class, @(time));
                [indexOfObjectTimes addObject:@(time)];
            }];
            
            [class testObjectAtIndexWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Search by index, time: %@", class, @(time));
                [objectAtIndexTimes addObject:@(time)];
            }];
            
            [class testDeletingWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Random delete, time: %@", class, @(time));
                [randomRemoveTimes addObject:@(time)];
            }];
            
            [class testDeletingLastElmentWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"%@. Remove last, time: %@", class, @(time));
                [removeAtEndTimes addObject:@(time)];
            }];
            
            [class testDeletingFirstElementWithArrayCapacity:num.intValue completion:^(uint64_t time) {
                [removeFirst addObject:@(time)];
            }];
            
            [class testAllocationWithCapacity:num.intValue completion:^(uint64_t time) {
                [allocations addObject:@(time)];
            }];
        }
        NSLog(@"Insert at beggin :%@", insertAtBeginTimes);
        NSLog(@"Insert at end :%@", insertAtEndTimes);
        NSLog(@"Random remove :%@", randomRemoveTimes);
        NSLog(@"Remove last :%@", removeAtEndTimes);
        NSLog(@"Index of object :%@", indexOfObjectTimes);
        NSLog(@"Object at index: %@", objectAtIndexTimes);
        NSLog(@"Remove First: %@", removeFirst);
        NSLog(@"Allocation: %@", allocations);
    }
}

+ (void)benchmarkNSMutableArray {
    [[self class] runBenchmarkingForClass:[NSMutableArray class]];
}

+ (void)benchmarkCustomMutableArray {
    [[self class] runBenchmarkingForClass:[MyMutableArray class]];
}

@end
