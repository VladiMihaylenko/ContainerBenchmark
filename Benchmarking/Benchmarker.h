//
//  Benchmarker.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BenchmarkerType) {
    BenchmarkerTypeNSMutableArray,
    BenchmarkerTypeCustomMutableArray,
    BenchmarkerTypeNSMutableDictionary,
    BenchmarkerTypeCustomMutableDictionary
};

@interface Benchmarker : NSObject
+ (void)runBenchmarkWithType:(BenchmarkerType)type;
@end
