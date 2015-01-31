//
//  PlayWithArraysTests.m
//  PlayWithArraysTests
//
//  Created by Aleksandra Borovytskaya on 1/18/15.
//  Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+TestUtils.h"

@interface PlayWithArraysTests : XCTestCase

@end

@implementation PlayWithArraysTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//
//- (void)testExample {
//    NSArray *borsh = @[@"Катошка", @"Морковка", @"Лук", @"Свекла", @"Чеснок", @"Томат"];
//
//    //enumeration in 'for' loop
//
//    for (int i = 0; i < borsh.count; i++) {
//        NSString *string = borsh[i];
//        NSLog(@"%@", string);
//    }
//
//    //fast enumeration
//
//    for (NSString *item in borsh) {
//        NSLog(@"%@", item);
//    }
//
//    //enumeration with block
//    [borsh enumerateObjectsUsingBlock:^(NSString *item, NSUInteger i, BOOL *stop) {
//        NSLog(@"%@", item);
//        *stop = YES;
//
//    }];
//}


//reversing Array
- (void)testExample2 {
    NSArray *borsh = [self getTestData];
    for (int i = borsh.count - 1; i >= 0; i--) {

        NSString *string = borsh[(NSUInteger) i];
        NSLog(@"%@", string);
    }

    for (NSString *item in borsh.reverseObjectEnumerator) {
        NSLog(@"%@", item);
    }
    [borsh.reverseObjectEnumerator.allObjects enumerateObjectsUsingBlock:^(NSString *item, NSUInteger i, BOOL *stop) {
        NSLog(@"%@", item);
        *stop = YES;

    }];

}

- (NSArray *) getTestData {
    return [NSArray loadTestListByName: @"Vegetables" clazz: [PlayWithArraysTests class]];
}

- (void)testExample3 {
    NSArray *borsh = [self getTestData];
    int i = [borsh indexOfObject:@"Лук"];
    NSLog(@"индекс элемента <Лук>:%d", i);

}

- (void)testExample4 {
    NSArray *borsh = [self getTestData];
    int i = [borsh indexOfObjectPassingTest:^BOOL(NSString *obj, NSUInteger idx, BOOL *stop) {
        BOOL result = [obj hasPrefix:@"М"];
        return result;
    }];

    NSLog(@"Индекс элемента, начинающийся на букву М: %d", i);


}

- (void)testExample5 {

    NSArray *borsh = [self getTestData];


    NSString *firstPlacePrefix = @"Т";

    borsh = [borsh sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {

        if ([obj1 hasPrefix:firstPlacePrefix] && [obj2 hasPrefix:firstPlacePrefix]) {
            return [obj1 compare:obj2];
        } else if ([obj2 hasPrefix:firstPlacePrefix]) {
            return NSOrderedDescending;
        }
        else if ([obj1 hasPrefix:firstPlacePrefix]) {
            return NSOrderedAscending;
        } else {
            return [obj1 compare:obj2];
        }

    }];

    [borsh logArray];

    }


- (void) testExample6 {
    NSArray *borsh = [self getTestData];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"Т"];
    NSArray *filtered = [borsh filteredArrayUsingPredicate:predicate];
    [filtered logArray];

}

- (void) testExample7 {
    NSArray *borsh = [self getTestData];

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {

     NSRange range = [evaluatedObject rangeOfString:@"ка" options: NSCaseInsensitiveSearch];
     BOOL result = range.location!=NSNotFound;
        return result;


    }];

    NSArray *filtered = [borsh filteredArrayUsingPredicate:predicate];
    [filtered logArray];

}

- (void) testExample8 {
    NSArray *borsh = [self getTestData];

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {

        BOOL result = evaluatedObject.length >5;
        return result;


    }];

    NSArray *filtered = [borsh filteredArrayUsingPredicate:predicate];
    [filtered logArray];

}

- (void) testExample9 {
    NSArray *borsh = [self getTestData];

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {

        BOOL result = [evaluatedObject hasPrefix: @"К"] && [evaluatedObject hasSuffix: @"а"];
        return result;


    }];

    NSArray *filtered = [borsh filteredArrayUsingPredicate:predicate];
    [filtered logArray];

}


- (void) testExample10 {
    NSArray *borsh = [self getTestData];
    NSMutableArray *result = [NSMutableArray array];

    [borsh enumerateObjectsUsingBlock:(void (^)(id, NSUInteger, BOOL *)) ^(NSString *item, NSUInteger i) {
            NSString *modifiedString = [item stringByReplacingOccurrencesOfString:@"а" withString:(NSString *) @"о"];
        [result addObject:modifiedString];
    }];
    NSArray *filtered = result;
    [filtered logArray];

}
- (void) testExample11 {
    NSArray *borsh = [self getTestData];
    NSMutableArray *result = [NSMutableArray array];

    for (int i = 0; i < borsh.count; i++) {

        NSString *line = borsh[i];

        NSRange range = [line rangeOfString:@"ка"];
        if (range.location != NSNotFound)
            [result addObject: line];
    }


    NSArray *filtered = result;
    [filtered logArray];

}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
