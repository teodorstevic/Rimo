//
//  ViewControllerHomeScreen.m
//  Rimo
//
//  Created by Mac novi on 7/17/14.
//  Copyright (c) 2014 Mac novi. All rights reserved.
//

#import "ViewControllerHomeScreen.h"
#import "SearchResultsFromCSV.h"
#import "ViewControllerLogIn.h"
@interface ViewControllerHomeScreen ()

@end

@implementation ViewControllerHomeScreen
@synthesize txtSearchOption1;
@synthesize tableviewSearchOption1, tableViewResultsFromSearch;
@synthesize mutableArrayResultsFromSearch;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mutableArrayResultsFromSearch = [[NSMutableArray alloc]init];
    tableviewSearchOption1.hidden = YES;
    tableViewResultsFromSearch.hidden = YES;
    [txtSearchOption1 addTarget:self action:@selector(returnArrayOfSearch) forControlEvents:UIControlEventEditingChanged];
    
    
    
}

-(void) returnArrayOfSearch{

    
    NSString *substring = @"L";
    if (txtSearchOption1.isEditing) {
        tableviewSearchOption1.hidden = NO;
        substring = txtSearchOption1.text;
    }
//    else if(txtTextField2.isEditing){
//        tableViewSuggestions2.hidden = NO;
//        substring = txtTextField2.text;
//    }
//
//    [self searchAutocompleteEntriesWithSubstring:substring];
    SearchResultsFromCSV *CSV = [[SearchResultsFromCSV alloc]init];
    
    mutableArrayResultsFromSearch = [CSV returnResults:7 :substring];
    NSLog(@"mutablearray:%@", mutableArrayResultsFromSearch);

    [tableviewSearchOption1 reloadData];
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//Setting numbers of sections for tableViews
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}





//Setting number of rows for table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutableArrayResultsFromSearch.count;
    
}




//Setting cells and showing them
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchoption1"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchoption1"];
        
    }
    
    cell.textLabel.text = [mutableArrayResultsFromSearch objectAtIndex:indexPath.row];

    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (txtSearchOption1.isEditing) {
        txtSearchOption1.text = cell.textLabel.text;
        tableviewSearchOption1.hidden = YES;
    }
//    else if (txtTextField2.isEditing){
//        txtTextField2.text = cell.textLabel.text;
//        tableViewSuggestions2.hidden = YES;
//    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
