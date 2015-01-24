//
//  MyMytableArray.m
//  TestTask
//
//  Created by Vlad Mihaylenko on 20/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import "MyMutableArray.h"

@implementation MyMutableArray {
    id *_objs;
    NSUInteger _count;
    NSUInteger _capacty;
}

#pragma mark - Init

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    return [super init];
}

#pragma mark - First

- (NSUInteger)count {
    return _count;
}

- (id)objectAtIndex:(NSUInteger)index {
    NSAssert(index >= 0, @"Index must be positive or 0");
    NSAssert(index <= _count - 1, @"Index out of bounds");
    return _objs[index];
}

#pragma mark - Second

- (void)addObject:(id)anObject {
    [self insertObject:anObject atIndex:[self count]];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (_count >= _capacty) {
        NSUInteger newCapacity = MAX(_capacty * 2, 16);
        if (!_objs) {
            _objs = malloc(newCapacity * sizeof(*_objs));
        } else {
            _objs = realloc(_objs, newCapacity * sizeof(*_objs));
        }
        _capacty = newCapacity;
    }
    memmove(_objs + index + 1, _objs + index, ([self count] - index) * sizeof(*_objs));
    _objs[index] = [anObject retain];
    _count++;
}


- (void)removeLastObject {
    [self removeObjectAtIndex:[self count] - 1];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [_objs[index] release];
    memmove(_objs + index, _objs + index + 1, ([self count] - index - 1) * sizeof(*_objs));
    _count--;
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [anObject retain];
    [_objs[index] release];
    _objs[index] = anObject;
}

- (NSUInteger)indexOfObject:(id)anObject {
    for (NSUInteger i = 0; i != _count; ++i)
        if ([anObject isEqual:_objs[i]])
            return i;
    return NSNotFound;
}


#pragma mark - Dealoc

- (void)dealloc {
    [self removeAllObjects];
    free(_objs);
    [super dealloc];
}


@end
