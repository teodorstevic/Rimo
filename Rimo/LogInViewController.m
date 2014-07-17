//
//  ViewController.m
//  Rimo
//
//  Created by Mac novi on 7/17/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "LogInViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonLogIn:(id)sender {
    [self performSegueWithIdentifier:@"logInToHomePage" sender:self];
}
@end
