//
//  ViewController.h
//  test search
//
//  Created by Sladjan on 7/14/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *txtTextField;
@property (strong, nonatomic) IBOutlet UITextField *txtTextField2;
@property (strong, nonatomic) IBOutlet UITableView *tableViewSuggestions;
@property (strong, nonatomic) IBOutlet UITableView *tableViewSuggestions2;
@property (strong, nonatomic) IBOutlet NSMutableArray *suggestions;
@property (strong, nonatomic) IBOutlet NSMutableArray *marrayRezultats;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *dict;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *idDict;
@property (strong, nonatomic) IBOutlet NSMutableArray  *arrayAdress;

- (void) textFieldshouldChange;
- (IBAction)buttonImportCSV:(id)sender;

@end
