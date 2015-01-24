//
//  main.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 21/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Benchmarker.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [Benchmarker runBenchmarkWithType:BenchmarkerTypeCustomMutableDictionary];
    }
    return 0;
}
