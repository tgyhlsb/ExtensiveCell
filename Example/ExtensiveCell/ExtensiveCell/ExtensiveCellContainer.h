//
//  ExtensiveCellContainer.h
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtensiveCellContainer : UITableViewCell


+ (NSString *)reusableIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView;

@end
