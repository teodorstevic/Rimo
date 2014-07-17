//
//  ViewControllerHomeScreen.h
//  Rimo
//
//  Created by Mac novi on 7/17/14.
//  Copyright (c) 2014 Mac novi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerHomeScreen : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtSearchOption1;
@property (weak, nonatomic) IBOutlet UITableView *tableviewSearchOption1;
@property (weak, nonatomic) IBOutlet UITableView *tableViewResultsFromSearch;
@property  (strong, nonatomic) IBOutlet NSMutableArray *mutableArrayResultsFromSearch;

-(void) returnArrayOfSearch;
@end
