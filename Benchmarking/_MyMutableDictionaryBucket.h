//
//  _MyMutableDictionaryBucket.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _MyMutableDictionaryBucket : NSObject
@property (nonatomic, copy) id key;
@property (nonatomic, retain) id obj;
@property (nonatomic, retain) _MyMutableDictionaryBucket *next;
@end
