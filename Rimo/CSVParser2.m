//
//  ViewController.m
//  test search
//
//  Created by Sladjan on 7/14/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CSVParser2.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableViewSuggestions   ;
@synthesize tableViewSuggestions2   ;
@synthesize txtTextField;
@synthesize txtTextField2;
@synthesize marrayRezultats;

@synthesize suggestions;

@synthesize dict;
@synthesize idDict;
@synthesize arrayAdress;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    marrayRezultats = [[NSMutableArray alloc]init];
    suggestions = [[NSMutableArray alloc]init];
    tableViewSuggestions.hidden = YES;
    tableViewSuggestions2.hidden = YES;
    [txtTextField addTarget:self action:@selector(textFieldshouldChange) forControlEvents:UIControlEventEditingChanged];
    [txtTextField2 addTarget:self action:@selector(textFieldshouldChange) forControlEvents:UIControlEventEditingChanged];
    arrayAdress = [[NSMutableArray alloc]init];
    dict = [[NSMutableDictionary alloc]init];
    idDict =[[NSMutableDictionary alloc]init];
    [self idDictFill];
}
-(void) textFieldshouldChange{
    NSLog(@"changed");
    
    NSString *substring = @"L";
    if (txtTextField.isEditing) {
        tableViewSuggestions.hidden = NO;
        substring = txtTextField.text;
    }
    else if(txtTextField2.isEditing){
        tableViewSuggestions2.hidden = NO;
        substring = txtTextField2.text;
    }
    
    [self searchAutocompleteEntriesWithSubstring:substring];
    
}




-(void)searchAutocompleteEntriesWithSubstring:(NSString *)substring{
    [suggestions removeAllObjects];
    for (NSString *curString in marrayRezultats){
        NSLog(@"%@-%@", curString,substring);
        
        if ([curString rangeOfString:substring options:NSCaseInsensitiveSearch].location == NSNotFound) {
            
        }
        else{
            [suggestions addObject:curString];
            
            
        }
        
    }
    if (txtTextField.isEditing) {
        [tableViewSuggestions reloadData];
    }
    else if (txtTextField2.isEditing){
        [tableViewSuggestions2 reloadData];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return suggestions.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adress"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adress"];
        
    }
    // Configure the cell...
    
    cell.textLabel.text = [suggestions objectAtIndex:indexPath.row];
    
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (txtTextField.isEditing) {
        txtTextField.text = cell.textLabel.text;
        tableViewSuggestions.hidden = YES;
    }
    else if (txtTextField2.isEditing){
        txtTextField2.text = cell.textLabel.text;
        tableViewSuggestions2.hidden = YES;
    }
}



- (IBAction)buttonImportCSV:(id)sender {
    
    NSMutableArray *adress = [self returnDemandedValues:21];
    marrayRezultats= adress;
    NSLog(@"%@", marrayRezultats);
    
}



-(NSArray *)returnDemandedValues:(int *)value{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WAP" ofType:@"csv"];
    NSString *fileDataString=[NSString stringWithContentsOfFile:path  encoding:NSUnicodeStringEncoding error:nil];
    NSArray *linesArray=[fileDataString componentsSeparatedByString:@"\n"];
    
    
    int k=1;
    
    for (id string in linesArray) {
        if (k<[linesArray count] -1) {
            
            NSString *red = [NSString stringWithFormat:@"%i;%@",k,[linesArray objectAtIndex:k]];
            NSArray *arrayred =[red componentsSeparatedByString:@";"];
            NSString *adress = [arrayred objectAtIndex:value];
            if ([adress  isEqual: @""]) {
                
            }
            else{
                NSString *postoji = [NSString stringWithFormat:@"%@",[dict objectForKey:adress]];
                NSLog(@"%@", postoji);
                NSLog(@"STRING:%@",[dict objectForKey:adress]);
                if ( [postoji isEqualToString: @"(null)"]){
                    [arrayAdress addObject:adress];
                    [dict setObject:[arrayred objectAtIndex:0] forKey:adress];
                }
                else{
                    NSString *keys= [NSString stringWithFormat:@"%@,%@", [dict objectForKey:adress],[arrayred objectAtIndex:0]];
                    [dict setObject:keys forKey:adress];
                    
                    
                    
                }
                
                
                
            }
            k+=1;
        }
    }
    NSMutableArray *adress = [[NSMutableArray alloc]init];
    adress = [dict allKeys];
    return adress;
}

-(void) idDictFill{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WAP" ofType:@"csv"];
    NSString *fileDataString=[NSString stringWithContentsOfFile:path  encoding:NSUnicodeStringEncoding error:nil];
    NSArray *linesArray=[fileDataString componentsSeparatedByString:@"\n"];
    
    
    int k=1;
    
    for (id string in linesArray) {
        if (k<[linesArray count] -1){
            [idDict setObject:[linesArray objectAtIndex:k] forKey:[NSString stringWithFormat:@"%i",k]];
        }
        k+=1;
    }
    NSLog(@"%@", idDict);
}


@end
