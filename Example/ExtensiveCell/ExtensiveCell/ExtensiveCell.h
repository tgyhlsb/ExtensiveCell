//
//  ExtensiveCell.h
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ECTableViewDelegate;

@interface ExtensiveCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UITableViewController<ECTableViewDelegate>  *tableViewDelegate;

+ (NSString *)reusableIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView;

- (void)initializeWithTableViewController:(UITableViewController *)tableViewController;

@end

@protocol ECTableViewDelegate <NSObject>

@optional
- (void)shouldExtendCellAtIndexPath:(NSIndexPath *)indexPath;

@end
