//
//  RootViewController.m
//  QuadSectionViewer
//
//  Created by Adrián García Betancourt on 25/01/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "RootViewController.h"
#import "Section1ViewController.h"
#import "Section2ViewController.h"
#import "Section3ViewController.h"
#import "Section4ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.animationDuration = 1.0;
        self.dataSource = [NSArray arrayWithObjects:[Section1ViewController class],
                                [Section2ViewController class],
                                [Section3ViewController class],
                                [Section4ViewController class],
                                nil];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
