//
//  ExtensiveCell.m
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import "ExtensiveCell.h"

#define REUSABLE_IDENTIFIER @"ExtensiveCell"

@interface ExtensiveCell()



@end

@implementation ExtensiveCell

+ (void)registerNibToTableView:(UITableView *)tableView
{
    UINib *nib = [UINib nibWithNibName:@"ExtensiveCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:[ExtensiveCell reusableIdentifier]];
}

+ (NSString *)reusableIdentifier
{
    return REUSABLE_IDENTIFIER;
}

- (void)initializeWithTableViewController:(UITableViewController *)tableViewController
{
    if ([tableViewController conformsToProtocol:@protocol(ECTableViewDelegate)])
    {
        self.tableViewDelegate = (UITableViewController<ECTableViewDelegate> *)tableViewController;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected)
    {
        NSIndexPath *indexPath = [self.tableViewDelegate.tableView indexPathForCell:self];
        [self.tableViewDelegate shouldExtendCellAtIndexPath:indexPath];
    }
}

@end
