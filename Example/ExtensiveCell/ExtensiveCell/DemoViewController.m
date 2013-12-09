//
//  DemoViewController.m
//  ExtensiveCell
//
//  Created by Tanguy Hélesbeux on 02/11/2013.
//  Copyright (c) 2013 Tanguy Hélesbeux. All rights reserved.
//

#import "DemoViewController.h"
#import <MapKit/MapKit.h>

@interface DemoViewController () <UITableViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;

@end

@implementation DemoViewController

- (NSInteger)ifIOS6FixWidth:(NSInteger)width {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        return width-20;
    }
    else
        return width;
}


- (MKMapView *)mapView
{
    if (!_mapView) _mapView = [[MKMapView alloc] initWithFrame:CGRectMake (0, 0, [self ifIOS6FixWidth:320], 128)];
    return _mapView;
}

#pragma mark ECTableViewDataSource

/*****
 
 Similar to tableView:cellForRowAtIndexPath: from UITableViewDataSource.
 
 Asks the data source for a cell to insert in a particular location of the table view. (required)
 The returned ExtensiveCell object is frequently one that the application reuses for performance reasons. 
 You should fetch a previously created cell object that is marked for reuse by sending a dequeueReusableCellWithIdentifier: message to tableView.
 
 The container displayed do not interfer with the indexPath.
 ECViewController manages the indexPath when you open/close a row. ECViewController will call viewForContainerAtIndexPath: to get the container view.
 
*****/

- (UITableViewCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"demoCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}



/*****
 
 Similar to tableView:heightForRowAtIndexPath: from UITableViewDelegate.
 
 Must return the height for the row at indexPath.
 
 The container displayed do not interfer with the indexPath.
 ECViewController manages the indexPath when you open/close a row. ECViewController will size the container to fit its given view.
 
*****/

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

/*****
 
 Similar to numberOfSectionsInTableView: from UITableViewDataSource.
 
*****/

- (NSInteger)numberOfSections
{
    return 2;
}
/*****
 
 Similar to tableview:numberOfRowsInSection: from UITableViewDataSource.
 
 Do not consider the container (open or closed) when calculating the number of rows.
 
*****/

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

/*****
 
 Asks the data source for a view to display in the container when selecting a row.
 You should fetch a previously created view object for performance reasons.
 
 The ECViewcontroller tableview only has one container and reuses it.
 
*****/

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
        {
            // Will instantiate the DatePickerView on every opening/closing
            UIDatePicker *datePicker = [[UIDatePicker alloc] init];
            
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
                CGRect frame = datePicker.frame;
                frame.size.width -= 20;
                [datePicker setFrame: frame];
            }
            
            UIView *dropDownView = datePicker;
            
            return dropDownView;
        }
        case 2:
        {
            // Will instantiate the MapView once. Best way for better performances.
            return self.mapView;
        }
        case 3:
        {
            // Will instantiate the View on every opening/closing
            // The frame origin set to (10, 10) will create a margin-top and margin-left effect of 10 pixels.
            // Width 300 will do the rest (the full width of the screen is 320 = 300 + 10 + 10).
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, [self ifIOS6FixWidth:300], 88)];
            dropDownView.backgroundColor = [UIColor redColor];
            return dropDownView;
        }
        case 4:
        {
            // Will instantiate the View on every opening/closing
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self ifIOS6FixWidth:320], 88)];
            dropDownView.backgroundColor = [UIColor blueColor];
            return dropDownView;
        }
            
        default:
            return nil;
    }
}

#pragma mark UITableViewDelegate

/*****
 
 You still can implement UITableViewDelegate.
 
 Here we open a cell on select.
 
 Can't handle multiple selection yet.
 
*****/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self extendCellAtIndexPath:indexPath];
}


@end
