//
//  ECViewController.m
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import "ECViewController.h"
#import "ExtensiveCellContainer.h"

@interface ECViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *selectedRowIndexPath;

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ExtensiveCell registerNibToTableView:self.tableView];
    [ExtensiveCellContainer registerNibToTableView:self.tableView];
}

#pragma mark Selection mecanism

- (void)setSelectedRowIndexPath:(NSIndexPath *)selectedRowIndexPath
{
    _selectedRowIndexPath = selectedRowIndexPath;
}

- (BOOL)isSelectedIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath && self.selectedRowIndexPath)
    {
        if (indexPath.row == self.selectedRowIndexPath.row && indexPath.section == self.selectedRowIndexPath.section)
        {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExtendedCellIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath && self.selectedRowIndexPath)
    {
        if (indexPath.row == self.selectedRowIndexPath.row+1 && indexPath.section == self.selectedRowIndexPath.section)
        {
            return YES;
        }
    }
    return NO;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.numberOfRow)
    {
        self.numberOfRow = 5;
    }
    return self.numberOfRow;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [ExtensiveCell reusableIdentifier];
    
    if ([self isExtendedCellIndexPath:indexPath])
    {
        identifier = [ExtensiveCellContainer reusableIdentifier];
    }
    
    ExtensiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    
    if ([cell respondsToSelector:@selector(initializeWithTableViewController:)])
    {
        [cell initializeWithTableViewController:(UITableViewController *)self];
    }
    
    return cell;
}

#pragma mark ECTableViewDelegate

- (void)shouldExtendCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Should extend cell at indexPath : %@", indexPath);
    
    if (self.selectedRowIndexPath)
    {
        [self removeCellBelowIndexPath:self.selectedRowIndexPath];
        if (indexPath.row > self.selectedRowIndexPath.row)
        {
            indexPath = [NSIndexPath indexPathForRow:(indexPath.row-1) inSection:indexPath.section];
        }
    }
    
    if (indexPath) {
        if ([self isSelectedIndexPath:indexPath])
        {
            self.selectedRowIndexPath = nil;
        } else {
            self.selectedRowIndexPath = indexPath;
            [self insertCellBelowIndexPath:indexPath];
        }
    }
}

- (void)insertCellBelowIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [NSIndexPath indexPathForRow:(indexPath.row+1) inSection:indexPath.section];
    NSArray *pathsArray = @[indexPath];
    [self.tableView beginUpdates];
    self.numberOfRow = self.numberOfRow + 1;
    [self.tableView insertRowsAtIndexPaths:pathsArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)removeCellBelowIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [NSIndexPath indexPathForRow:(indexPath.row+1) inSection:indexPath.section];
    NSArray *pathsArray = @[indexPath];
    [self.tableView beginUpdates];
    self.numberOfRow = self.numberOfRow - 1;
    [self.tableView deleteRowsAtIndexPaths:pathsArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}


@end
