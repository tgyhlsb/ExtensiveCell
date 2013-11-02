//
//  ExtensiveCell.m
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import "ExtensiveCell.h"


@interface ExtensiveCell()



@end

@implementation ExtensiveCell

- (void)initializeWithTableViewController:(UITableViewController *)tableViewController
{
    if ([tableViewController conformsToProtocol:@protocol(ExtensiveCellDelegate)])
    {
        self.tableViewDelegate = (UITableViewController<ExtensiveCellDelegate> *)tableViewController;
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
