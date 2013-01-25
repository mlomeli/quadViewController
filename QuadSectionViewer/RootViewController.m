//
//  RootViewController.m
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithViewControllers: (NSMutableArray*) viewControllers
{
    self = [super init];
    if (self) {
        // Custom initialization
        _viewControllers = viewControllers;
    }
    return self;
}

-(void) loadView {
    
    NSMutableArray * viewsArray = [[NSMutableArray alloc] initWithCapacity:4];
    int controllerCount = 0;
    for (UIViewController<SingleViewControllerDelegate> * viewController in _viewControllers) {
        if(controllerCount >3)
            break;
        [viewsArray addObject:[viewController getMiniView]];
        controllerCount++;
    }
    
    RootView * rootView = [[RootView alloc] initWithFrame:self.parentViewController.view.frame andArrayOfViews:viewsArray];
    self.view = rootView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma-mark Rotation with Legacy support

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;

}

@end
