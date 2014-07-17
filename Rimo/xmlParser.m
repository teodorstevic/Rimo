//
//  xmlParser.m
//  testgDATAxml
//
//  Created by Sladjan on 7/15/14.
//  Copyright (c) 2014 Sladjan. All rights reserved.
//

#import "xmlParser.h"
#import "GDataXMLNode.h"

@implementation xmlParser

-(NSString *)dataFilePath:(BOOL)forSave{
    return [[NSBundle mainBundle]pathForResource:@"test1" ofType:@"xml"];
}

-(void)parse{

    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"test3" ofType:@"xml"];
    NSData *xmlData = [[NSMutableData alloc]initWithContentsOfFile:filePath];
    NSError*error;
    GDataXMLDocument *xml = [[GDataXMLDocument alloc]initWithData:xmlData options:0 error:&error];
    NSLog(@"ALL%@",xml.rootElement);
    
    NSArray *rooms = [xml.rootElement children];
    NSLog(@"ROOMS %@",rooms);
    for (GDataXMLElement *elements in rooms){
        NSArray *room = [elements children];
        NSLog(@"ROOM: %@",room);
        for(GDataXMLElement *element in room){
        NSString *roomName = [element name];
        NSArray *roomAtributes = [element children];
        NSLog(@"Room NAME %@",roomName);
            for(GDataXMLElement *elementss in roomAtributes){
                NSString *atributes = [elementss name];
                NSLog(@"Room Atribute %@",atributes);
                NSArray *nesto = [elements nodesForXPath:atributes error:nil];
                NSLog(@"%@", nesto);
                
                
            }
        
        }
    }
    
    
    
    
}
@end
