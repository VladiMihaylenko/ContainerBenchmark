//
//  ArrayBenchmarker.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "ArrayBenchmarker.h"
#import "NSMutableArray+Benchmark.h"

@implementation ArrayBenchmarker

+ (void)benchmarkNSMutableArray {
    @autoreleasepool {
       const NSArray *capacity = @[@1000, @10000, @100000, @300000, @800000, @1000000];
        NSMutableArray *insertAtBeginTimes = [NSMutableArray array];
        NSMutableArray *insertAtEndTimes = [NSMutableArray array];
        NSMutableArray *randomRemoveTimes = [NSMutableArray array];
        NSMutableArray *removeAtEndTimes = [NSMutableArray array];
        NSMutableArray *indexOfObjectTimes = [NSMutableArray array];
        NSMutableArray *objectAtIndexTimes = [NSMutableArray array];
       
        for (NSNumber *num in capacity) {
            NSLog(@"CAPACITY : %@", num);
            [NSMutableArray testInsertionAtBeginWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Insert at beginning, time: %@", @(time) );
                [insertAtBeginTimes addObject:@(time)];
            }];
            
            [NSMutableArray testInsertionAtEndWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Inset at end, time: %@", @(time) );
                [insertAtEndTimes addObject:@(time)];
            }];
            
            [NSMutableArray testIndexOfObjectWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Search by value, time: %@", @(time) );
                [indexOfObjectTimes addObject:@(time)];
            }];
            
            [NSMutableArray testObjectAtIndexWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Search by index, time: %@", @(time));
                [objectAtIndexTimes addObject:@(time)];
            }];
            
            [NSMutableArray testDeletingWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Random delete, time: %@", @(time));
                [randomRemoveTimes addObject:@(time)];
            }];
            
            [NSMutableArray testDeletingLastElmentWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Remove last, time: %@", @(time));
                [removeAtEndTimes addObject:@(time)];
            }];

        }
    }
    
}

@end
