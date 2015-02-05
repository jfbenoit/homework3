//
//  TodoList.h
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoList : NSObject

@property NSMutableArray * list;
@property BOOL allowDups;

+(instancetype)todoList;

-(void)addItem:(TodoItem*)item;
-(void)removeItem:(TodoItem*)item;
-(void)setDups:(BOOL)flag;

-(NSInteger) count;

-(NSString*) getTodoItemTitleAtIndex:(int)index;

-(bool) canAddTodo:(NSString*)title;

-(bool) canRemoveTodo:(NSString*)title;

+(instancetype) prepopulateWithMusicalInstruments;

+(instancetype) prepopulateWithHomeworkQuestions;

-(void)logItems;

@end