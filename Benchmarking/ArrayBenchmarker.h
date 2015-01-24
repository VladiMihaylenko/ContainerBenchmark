//
//  ArrayBenchmarker.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayBenchmarker : NSObject
+ (void)benchmarkNSMutableArray;
+ (void)benchmarkCustomMutableArray;
@end
