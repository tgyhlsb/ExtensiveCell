//
//  ECViewController.h
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtensiveCell.h"

#define MAIN_CELLS_HEIGHT 44

@protocol ECTableViewDataSource <NSObject>

- (ExtensiveCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ECViewController : UIViewController <ECTableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end

