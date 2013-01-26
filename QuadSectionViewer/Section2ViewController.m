//
//  Section2ViewController.m
//  QuadSectionViewer
//
//  Created by Adrián García Betancourt on 25/01/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "Section2ViewController.h"

@interface Section2ViewController ()

- (void)handleDoubleTap:(UITapGestureRecognizer *)sender;

@end

@implementation Section2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:@"BLUE Controller"];
    [label sizeToFit];
    
    [view setBackgroundColor:[UIColor blueColor]];
    [view addSubview:label];
    
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTapGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIView *)controllerView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:@"BLUE Controller"];
    [label sizeToFit];
    
    [view setBackgroundColor:[UIColor blueColor]];
    [view addSubview:label];
    
    return view;
}

- (void) handleDoubleTap:(UITapGestureRecognizer *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

@end
