//
//  SearchResultsFromCSV.h
//  Rimo
//
//  Created by Mac novi on 7/17/14.
//  Copyright (c) 2014 Mac novi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResultsFromCSV : NSObject
@property (strong, nonatomic) IBOutlet NSMutableArray *mutableArrayAdress;
@property (strong, nonatomic) IBOutlet NSMutableArray *mutableArray;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *dict;
@property (strong, nonatomic) IBOutlet NSMutableDictionary *idDict;
@property (strong, nonatomic) IBOutlet NSMutableArray  *arrayAdress;

-(NSMutableArray *) returnResults:(int) colon : (NSString *) substring;
-(NSMutableArray *)returnDemandedValues:(int *)value;
@end
