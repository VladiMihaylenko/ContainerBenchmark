//
//  Benchmarker.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "Benchmarker.h"
#import "ArrayBenchmarker.h"
#import "CustomArrayBenchmarker.h"
#import "DictionaryBenchmarker.h"
#import "CustomDictionaryBenchmarker.h"


const size_t iterations = 100;

@implementation Benchmarker

+ (void)runBenchmarkWithType:(BenchmarkerType)type {
    switch (type) {
        case BenchmarkerTypeNSMutableArray:
            [ArrayBenchmarker benchmarkNSMutableArray];
            break;
        case BenchmarkerTypeCustomMutableArray:
            [CustomArrayBenchmarker benchmarkCustomMutableArray];
            break;
        case BenchmarkerTypeNSMutableDictionary:
            [DictionaryBenchmarker benchmarkNSMutableDictionary];
            break;
        case BenchmarkerTypeCustomMutableDictionary:
            [CustomDictionaryBenchmarker benchmarkCustomMutableDictionary];
            break;
    }
}



@end
