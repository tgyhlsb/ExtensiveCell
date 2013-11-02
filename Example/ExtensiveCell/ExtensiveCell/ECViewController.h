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

@interface ECViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ECTableViewDelegate>

@property (nonatomic) NSInteger numberOfRow;
@property (strong, nonatomic) UIView *detailView;


@end
