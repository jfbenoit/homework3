//
//  ViewController.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ViewController.h"
#import "TodoItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.listTable.delegate = self;
    self.listTable.dataSource = self;
    self.itemInput.delegate = self;
    self.list = [TodoList todoList];
    self.addButton.enabled = NO;
    self.removeButton.enabled = NO;
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.list count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cellid" owner:nil];
//    cell.textField.stringValue = @(row).stringValue;
    cell.textField.stringValue = [self.list getTodoItemTitleAtIndex:(int)row];
    return cell;
}

-(IBAction)addButtonPushed:(id)sender {
    TodoItem *i = [TodoItem todoItemWithTitle:self.itemInput.stringValue];
    [self.list addItem:i];
    [self.list logItems];
    [self.listTable reloadData];
    self.itemInput.stringValue = @"";
    self.addButton.enabled = NO;
    
}

-(IBAction)removeButtonPushed:(id)sender {
    TodoItem *i = [TodoItem todoItemWithTitle:self.itemInput.stringValue];
    [self.list removeItem:i];
    [self.list logItems];
    [self.listTable reloadData];
    self.itemInput.stringValue = @"";
    self.removeButton.enabled = NO;
    self.addButton.enabled = NO;
    
}

-(IBAction)duplicateCheckboxClicked:(id)sender {
    [self updateListDupSetting];
}

-(void) updateListDupSetting {
    NSLog(@"checkbox value: %@",self.dupsCheckbox.stringValue);
    if ([self.dupsCheckbox.stringValue isEqualToString: @"1"]) {
        [self.list setDups:true];
        [self updateButtons];
    } else {
        [self.list setDups:false];
        [self updateButtons];
    }
}


- (void)controlTextDidChange:(NSNotification *)obj {
    [self updateButtons];
}

-(void)updateButtons {
    if (!self.itemInput.stringValue.length) {
        self.addButton.enabled = NO;
    } else if (![self.list canAddTodo:self.itemInput.stringValue]) {
        self.addButton.enabled = NO;
    } else {
        self.addButton.enabled = YES;
    }
    
    if (!self.itemInput.stringValue.length) {
        self.removeButton.enabled = NO;
    } else if ([self.list canRemoveTodo:self.itemInput.stringValue]) {
        self.removeButton.enabled = YES;
    } else {
        self.removeButton.enabled = NO;
    }

}

-(IBAction)prepop1ButtonClicked:(id)sender {
    self.list = [TodoList prepopulateWithMusicalInstruments];
    [self.listTable reloadData];
    [self updateListDupSetting];
    
}

-(IBAction)prepop2ButtonClicked:(id)sender {
    self.list = [TodoList prepopulateWithHomeworkQuestions];
    [self.listTable reloadData];
    [self updateListDupSetting];
}

@end
