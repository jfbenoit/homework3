//
//  TodoItem.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

+(instancetype)todoItemWithTitle:(NSString*)title {
    TodoItem *item = [[self alloc] init];
    item.title = title;
    return item;
}

- (BOOL) isEqual:(id) other {
    NSLog(@"comparing todoitems");
    if (self == other) {
        return YES;
    }
    if (![other isKindOfClass:[self class]]) {
        return NO;
    }
    if ([self.title isEqualToString: ((TodoItem *)other).title]) {
        return YES;
    }
    return NO;
}

@end