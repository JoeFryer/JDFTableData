//
//  JDFViewController.m
//  JDFTableData
//
//  Created by Joe Fryer on 10/23/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import "JDFViewController.h"

// JDFTableData
#import "JDFTableData.h"



@interface JDFViewController ()

@property (nonatomic) JDFTableData *tableData;

@end



@implementation JDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"JDFTableData";
    
    [self setupTableSections];
}


#pragma mark - Setup

- (void)setupTableSections
{
    JDFTableSection *tableSection1 = [[JDFTableSection alloc] initWithHeaderString:@"Section 1"];
    [tableSection1 addTableRow:[[JDFTableRow alloc] initWithTitle:@"Row 1" rowType:JDFRowTypeDataDisplay]];
    [tableSection1 addTableRowsWithTitles:@[@"Row 2", @"Row 3", @"Row 4"] rowType:JDFRowTypeDataDisplay];
    
    JDFTableSection *tableSection2 = [[JDFTableSection alloc] initWithHeaderString:@"Section 2"];
    [tableSection2 addTableRowsWithTitles:@[@"Apples", @"Pears", @"Bananas", @"Oranges"] rowType:JDFRowTypeDataDisplay];
    
    self.tableData = [[JDFTableData alloc] initWithSections:@[tableSection1, tableSection2]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tableData numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDFTableRow *tableRow = [self.tableData tableRowForIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = tableRow.title;
    return cell;
}


#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    JDFTableSection *tableSection = self.tableData.sections[section];
    return tableSection.headerString;
}

@end
