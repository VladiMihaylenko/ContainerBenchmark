//
//  _MyBlockEnumerator.h
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 22.01.15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef id (^MyEnumeratorBlock) ();
@interface _MyBlockEnumerator : NSEnumerator {
  MyEnumeratorBlock _block;
}
- (instancetype)initWithBlock:(MyEnumeratorBlock)block;

@end
