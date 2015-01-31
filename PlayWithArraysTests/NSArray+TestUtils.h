//
// Created by Aleksandra Borovytskaya on 1/25/15.
// Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TestUtils)

+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz;

- (void)logArray;

- (NSMutableArray *)arrayByRemovingDuplications;

- (int)countOfObjectsOccurences:(id)object;

@end