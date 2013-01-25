//
//  SingleQuadViewController.m
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "SingleQuadViewController.h"
#import "MiniView.h"


@interface SingleQuadViewController ()

@end

@implementation SingleQuadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (MiniView*) getMiniView
{
  
      UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(miniViewTapped:)];
    
    MiniView * miniView = [[MiniView alloc] initWithFrame:CGRectZero];
    [miniView addGestureRecognizer:tap];
    
    return miniView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) miniViewTapped: (id) sender
{
    [(NSObject*)sender logDescription];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
