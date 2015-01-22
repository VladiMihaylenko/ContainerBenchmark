//
//  CustomArrayBenchmarker.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "CustomArrayBenchmarker.h"
#import "MyMutableArray.h"
#import "MyMutableArray+Benchmark.h"

@implementation CustomArrayBenchmarker

+ (void)benchmarkCustomMutableArray {
    
    @autoreleasepool {
       const NSArray *capacity = @[@1000, @10000, @100000, @300000, @800000, @1000000];
        
        for (NSNumber *num in capacity) {
            NSLog(@"CAPACITY : %@", num);
            [MyMutableArray testInsertionAtBeginWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Insert at beginning, time: %@", @(time) );
            }];
            
            [MyMutableArray testInsertionAtEndWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Inset at end, time: %@", @(time) );
            }];
            
            [MyMutableArray testIndexOfObjectWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Search by value, time: %@", @(time) );
            }];
            
            [MyMutableArray testObjectAtIndexWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Search by index, time: %@", @(time));
            }];
            
            [MyMutableArray testDeletingWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Random delete, time: %@", @(time));
            }];
            
            [MyMutableArray testDeletingLastElmentWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Remove last, time: %@", @(time));
            }];

        }
    }
}

@end
