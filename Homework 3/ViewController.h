//
//  ViewController.h
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate,  NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *itemInput;

@property (weak) IBOutlet NSButton *addButton;


@property (weak) IBOutlet NSButton *removeButton;

@property (weak) IBOutlet NSButton *dupsCheckbox;

@property (weak) IBOutlet NSTableView *listTable;

@property TodoList *list;

@property (weak) IBOutlet NSButton *prepop1Button;

@property (weak) IBOutlet NSButton *prepop2Button;

@end

