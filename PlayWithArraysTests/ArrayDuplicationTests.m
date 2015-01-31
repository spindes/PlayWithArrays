//
//  ArrayDuplicationTests.m
//  PlayWithArrays
//
//  Created by Aleksandra Borovytskaya on 1/28/15.
//  Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+TestUtils.h"

@interface ArrayDuplicationTests : XCTestCase

@end

@implementation ArrayDuplicationTests

- (void)testArrayByRemovingDuplications {
    NSArray *testArray = @[@"abc", @"abm", @"abc"];
    NSMutableArray *resultArray = [testArray arrayByRemovingDuplications];
    XCTAssertEqual(resultArray.count, 2);
    XCTAssertNotEqual([resultArray indexOfObject:@"abm"], NSNotFound);
    XCTAssertNotEqual([resultArray indexOfObject:@"abc"], NSNotFound);

}
- (void)testCountOfObjectOccurences {
    NSArray *simpleData = @[@"abc", @"abc", @"aba"];
    XCTAssertEqual([simpleData countOfObjectsOccurences:@"abc"], 2);
    XCTAssertEqual([simpleData countOfObjectsOccurences:@"cadabra"], 0);

}
- (NSArray *) getTestData {
    return [NSArray loadTestListByName: @"CartoonsCharacters" clazz: [ArrayDuplicationTests class]];
}

- (void)testCountOfDuplicates {
    NSArray *CartoonCharacters = [self getTestData];
    NSMutableArray *uniqueList = [CartoonCharacters arrayByRemovingDuplications];
    for (int i = 0; i < uniqueList.count; i++) {
        int countOfOccurences = [CartoonCharacters countOfObjectsOccurences:uniqueList[i]];
        NSLog(@"%@ - %d", uniqueList[i], countOfOccurences);
    }

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
