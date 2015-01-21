//
//  main.m
//  Benchmarking
//
//  Created by Vlad Mihaylenko on 21/01/15.
//  Copyright (c) 2015 Vlad Mihaylenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyMutableArray.h"

extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));
typedef void (^BenchmarkCompletionHandler) (uint64 time);
static size_t const iterations = 100;

#pragma mark - NSMutableArray Benchmark

@interface NSMutableArray (Benchmark)
+ (void)testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testInsertionAtBegginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
@end

@implementation NSMutableArray (Benchmark)
+ (void)testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        @autoreleasepool {
            [array removeLastObject];
        }
    });
    completion(t_0);
}

+ (void)testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        @autoreleasepool {
            NSUInteger index = rand()%capacity;
            [array removeObjectAtIndex:index];
        }
    });
    completion(t_0);
}

+ (void)testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            [array addObject:num];
        }
    });
    completion(t_0);
}

+ (void)testInsertionAtBegginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            [array insertObject:num atIndex:0];
        }
    });
    completion(t_0);
}

+ (void)testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSUInteger index = rand()%capacity;
            [array objectAtIndex:index];
        }
    });
    completion(t_0);
    
}

+ (void)testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    NSMutableArray *array = _mutableArrayWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSNumber *num = @(rand()%capacity);
            [array indexOfObject:num];
        }
    });
    completion(t_0);
}

NSMutableArray* _mutableArrayWithCapacity(int capacity) {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i != capacity; ++i) {
        [array addObject:@(i)];
    }
    return array;
}

@end

#pragma mark - MyMutableArray Benchmark

@interface MyMutableArray (My_Benchmark)
+ (void)my_testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)my_testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)my_testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)my_testInsertionAtBegginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)my_testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
+ (void)my_testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion;
@end


@implementation MyMutableArray (My_Benchmark)
+ (void)my_testDeletingLastElmentWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        @autoreleasepool {
            [array removeLastObject];
        }
    });
    completion(t_0);
}

+ (void)my_testDeletingWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(10*capacity);
    uint64_t t_0 = dispatch_benchmark(iterations/10, ^{
        @autoreleasepool {
            NSUInteger index = rand()%capacity;
            [array removeObjectAtIndex:index];
        }
    });
    completion(t_0);
}

+ (void)my_testInsertionAtEndWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            [array addObject:num];
        }
    });
    completion(t_0);
}

+ (void)my_testInsertionAtBegginWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    NSNumber *num = @(rand());
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            [array insertObject:num atIndex:0];
        }
    });
    completion(t_0);
}

+ (void)my_testObjectAtIndexWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSUInteger index = rand()%capacity;
            [array objectAtIndex:index];
        }
    });
    completion(t_0);
    
}

+ (void)my_testIndexOfObjectWithArrayCapacity:(const int)capacity completion:(BenchmarkCompletionHandler)completion {
    MyMutableArray *array = _myMutableArrayWithCapacity(capacity);
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSNumber *num = @(rand()%capacity);
            [array indexOfObject:num];
        }
    });
    completion(t_0);
}

MyMutableArray* _myMutableArrayWithCapacity(int capacity) {
    MyMutableArray *array = [MyMutableArray array];
    for (int i = 0; i != capacity; ++i) {
        [array addObject:@(i)];
    }
    return array;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        const NSArray *capacity = @[@1000, @10000, @100000, @300000, @800000, @1000000];
        NSMutableArray *times = [NSMutableArray array];
        for (NSNumber *num in capacity) {
            NSLog(@"КОЛИЧЕСТВО ЭЛЕМЕНТОВ : %@", num);
            
            [NSMutableArray testInsertionAtBegginWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Вставка в начало, время: %@", @(time) );
                [times addObject:@(time)];
            }];
            
            [MyMutableArray my_testInsertionAtBegginWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Вставка в начало, время: %@", @(time) );
            }];
            
            [NSMutableArray testInsertionAtEndWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Вставка в конец, время: %@", @(time) );
            }];
            
            [MyMutableArray my_testInsertionAtEndWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Вставка в конец, время: %@", @(time) );
            }];
            
            [NSMutableArray testIndexOfObjectWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Поиск по значению, время: %@", @(time) );
            }];
            
            [MyMutableArray my_testIndexOfObjectWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Поиск по значению, время: %@", @(time) );
            }];     
        
            [NSMutableArray testObjectAtIndexWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Поиск по индексу, время: %@", @(time));
            }];
            
            [MyMutableArray my_testObjectAtIndexWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Поиск по индексу, время: %@", @(time));
            }];
            
            [NSMutableArray testDeletingWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Удаление случайного, время: %@", @(time));
            }];
            
            [MyMutableArray my_testDeletingWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Удаление случайного, время: %@", @(time));
            }];
            
            [NSMutableArray testDeletingLastElmentWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"NSMutableArray. Удаление последнего, время: %@", @(time));
            }];
            
            [MyMutableArray my_testDeletingLastElmentWithArrayCapacity:num.intValue completion:^(uint64 time) {
                NSLog(@"MyMutableArray. Удаление последнего, время: %@", @(time));
            }];
            
        }
        
    }
    return 0;
}
