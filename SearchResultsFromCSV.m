//
//  SearchResultsFromCSV.m
//  Rimo
//
//  Created by Mac novi on 7/17/14.
//  Copyright (c) 2014 Mac novi. All rights reserved.
//

#import "SearchResultsFromCSV.h"

@implementation SearchResultsFromCSV
@synthesize dict;
@synthesize arrayAdress;
@synthesize mutableArrayAdress;

-(NSMutableArray *) returnResults:(int) colon : (NSString *) substring{
    NSLog(@"changed");
    mutableArrayAdress = [[NSMutableArray alloc]init];
    NSMutableArray *adress = [self returnDemandedValues:&colon];
    
    [mutableArrayAdress removeAllObjects];
    for (NSString *curString in adress){
        NSLog(@"%@-%@", curString,substring);
        
        if ([curString rangeOfString:substring options:NSCaseInsensitiveSearch].location == NSNotFound) {
            
        }
        else{
            [mutableArrayAdress addObject:curString];
            
            
        }
        
    }
        return mutableArrayAdress;
}
    
    




-(NSMutableArray *)returnDemandedValues:(int *)value{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WAP" ofType:@"csv"];
    NSString *fileDataString=[NSString stringWithContentsOfFile:path  encoding:NSUnicodeStringEncoding error:nil];
    NSArray *linesArray=[fileDataString componentsSeparatedByString:@"\n"];
    dict = [[NSMutableDictionary alloc]init];
    arrayAdress = [[NSMutableArray alloc]init];
    
    int k=1;
    
    for (id string in linesArray) {
        if (k<[linesArray count] -1) {
            
            NSString *red = [NSString stringWithFormat:@"%i;%@",k,[linesArray objectAtIndex:k]];
            NSArray *arrayred =[red componentsSeparatedByString:@";"];
            NSLog(@"%@", arrayred);
            NSString *adress = [arrayred objectAtIndex:7];
            NSLog(@"%@", adress);
            
            
            
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



@end


