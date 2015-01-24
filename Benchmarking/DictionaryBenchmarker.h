//
//  DictionaryBenchmarker.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 23/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryBenchmarker : NSObject
+ (void)benchmarkNSMutableDictionary;
+ (void)benchmarkCustomMutableDictionary;
@end
