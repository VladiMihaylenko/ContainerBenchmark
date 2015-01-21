//
//  MyMytableArray.h
//  TestTask
//
//  Created by Vlad Mihaylenko on 20/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMutableArray : NSMutableArray
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
