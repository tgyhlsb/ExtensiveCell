//
//  DemoViewController.m
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController



- (ExtensiveCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"demoCell";
    ExtensiveCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
        {
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 88)];
            dropDownView.backgroundColor = [UIColor redColor];
            return dropDownView;
        }
        case 2:
        {
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 200, 88)];
            dropDownView.backgroundColor = [UIColor blueColor];
            return dropDownView;
        }
        case 3:
        {
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 88)];
            dropDownView.backgroundColor = [UIColor greenColor];
            return dropDownView;
        }
        case 4:
        {
            UIView *dropDownView = [[UIDatePicker alloc] init];
            return dropDownView;
        }
            
        default:
            return nil;
    }
}

@end
