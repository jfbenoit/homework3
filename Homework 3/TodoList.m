//
//  TodoList.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ToDoList.h"


@implementation TodoList

+(instancetype)todoList
{
    TodoList *tdl = [[self alloc] init];
    tdl.list = [[NSMutableArray alloc] init];
    tdl.allowDups = true;
    return tdl;
}

-(void)addItem:(TodoItem*)item {
    [self.list addObject:item];
}

-(void)removeItem:(TodoItem*)item {
    [self.list removeObject:item];
}

-(NSInteger)count {
    NSLog(@"list count: %lu",(unsigned long)[self.list count]);
    return [self.list count];
}

-(NSString*) getTodoItemTitleAtIndex:(int)index {
    NSLog(@"getting item at index %d",index);
    return ((TodoItem *)self.list[index]).title;
}

-(void)setDups:(BOOL)flag {
    self.allowDups = flag;
}

-(bool) canAddTodo:(NSString*)title {
    NSLog(@"checking to see if we can add");
    TodoItem *i = [TodoItem todoItemWithTitle:title];
    if ([self.list containsObject:i] && !self.allowDups) {
        return false;
    } else {
        return true;
    }
}

-(bool) canRemoveTodo:(NSString*)title {
    NSLog(@"checking to see if we can remove");
    TodoItem *i = [TodoItem todoItemWithTitle:title];
    if ([self.list containsObject:i]) {
        return true;
    } else {
        return false;
    }
}


// TODO: refactor these two methods to prevent code duplication
+(instancetype) prepopulateWithMusicalInstruments {
    TodoList *tdl = [[self alloc] init];
    NSArray * array = [NSArray arrayWithObjects: @"Drums", @"Guitar", @"Cello", @"Piano", @"Banjo", nil];
    NSMutableArray *tlist = [[NSMutableArray alloc] init];
    for (NSString *current in array) {
        TodoItem *i = [TodoItem todoItemWithTitle:current];
        [tlist addObject:i];
    }
    tdl.list = tlist;
    tdl.allowDups = true;
    return tdl;
}

+(instancetype) prepopulateWithHomeworkQuestions {
    TodoList *tdl = [[self alloc] init];
    NSArray * array = [NSArray arrayWithObjects:
        @"What is @(row) doing when row is already a NSInteger?",
        @"BOOL vs bool vs Boolean ...?",
        @"How to reference view controller from app delegate?",
        @"What is this nil doing at the end of the array?",
        nil];
    NSMutableArray *tlist = [[NSMutableArray alloc] init];
    for (NSString *current in array) {
        TodoItem *i = [TodoItem todoItemWithTitle:current];
        [tlist addObject:i];
    }
    tdl.list = tlist;
    tdl.allowDups = true;
    return tdl;
}


-(void) logItems {
    for (int i = self.list.count; i > 0; i--) {
        NSLog(@"item: %@ at index %d",((TodoItem *)self.list[i-1]).title, i);
    }
}

@end