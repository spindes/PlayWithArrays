//
// Created by Aleksandra Borovytskaya on 1/25/15.
// Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import "NSArray+TestUtils.h"


@implementation NSArray (TestUtils)


+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz
{
    NSBundle *bundle = [NSBundle bundleForClass: clazz];

    NSString *path = [bundle pathForResource:listName ofType:@"plist"];

    NSURL *url = [NSURL fileURLWithPath:path];

    NSArray *borsh = [NSArray arrayWithContentsOfURL:url];
    return borsh;
}

-(void) logArray {
    NSString *arrayAsString = [self componentsJoinedByString:@"\n"];
    NSLog(@"Array, count:%d [\n%@ ]\n", self.count, arrayAsString);
}

- (NSMutableArray *)arrayByRemovingDuplications {
    NSMutableArray *result = [[NSMutableArray alloc] init];

    for (int i = 0; i < self.count; i++) {
        if (![result containsObject:self[i]]) {
            [result addObject:self[i]];
        }
    }

    return result;
}

- (int)countOfObjectsOccurences:(id)object {
    int result =0;
    for (int i = 0; i < self.count; i++) {
        if ([self[i] isEqual:object]  )
            result ++;
    }
    return result;
}



@end