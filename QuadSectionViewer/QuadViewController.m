//
//  QuadViewController.m
//  QuadSectionViewer
//
//  Created by Adrián García Betancourt on 25/01/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "QuadViewController.h"

#define SECTION_1 0
#define SECTION_2 1
#define SECTION_3 2
#define SECTION_4 3

#define STATE_NORMAL 0
#define STATE_SECTION_1_EXPANDED 1
#define STATE_SECTION_2_EXPANDED 2
#define STATE_SECTION_3_EXPANDED 3
#define STATE_SECTION_4_EXPANDED 4

@interface QuadViewController ()

@property BOOL tapGestureIsBeingHandled;

@property UIView *section1View;
@property UIView *section2View;
@property UIView *section3View;
@property UIView *section4View;

- (void)handleTap:(UITapGestureRecognizer *)sender;
- (void)animateExpandSection:(UIView *)section;
- (void)animateCollapseSection:(UIView *)section;
- (CGRect)section1Frame;
- (CGRect)section2Frame;
- (CGRect)section3Frame;
- (CGRect)section4Frame;

@end

@implementation QuadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if (!self.animationDuration) {
            self.animationDuration = 2.0;
        }
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    self.section1View = [(id<QuadViewControllerDataSource>)[self.dataSource objectAtIndex:0] controllerView];
    [self.section1View setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    [self.section1View setFrame:[self section1Frame]];
    [self.section1View setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight|
     UIViewAutoresizingFlexibleRightMargin|
     UIViewAutoresizingFlexibleBottomMargin];
    [view addSubview:self.section1View];

    self.section2View = [(id<QuadViewControllerDataSource>)[self.dataSource objectAtIndex:1] controllerView];
    [self.section2View setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    [self.section2View setFrame:[self section2Frame]];
    [self.section2View setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight|
     UIViewAutoresizingFlexibleLeftMargin|
     UIViewAutoresizingFlexibleBottomMargin];
    [view addSubview:self.section2View];
    
    self.section3View = [(id<QuadViewControllerDataSource>)[self.dataSource objectAtIndex:2] controllerView];
    [self.section3View setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    [self.section3View setFrame:[self section3Frame]];
    [self.section3View setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight|
     UIViewAutoresizingFlexibleTopMargin|
     UIViewAutoresizingFlexibleRightMargin];
    [view addSubview:self.section3View];
    
    self.section4View = [(id<QuadViewControllerDataSource>)[self.dataSource objectAtIndex:3] controllerView];
    [self.section4View setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    [self.section4View setFrame:[self section4Frame]];
    [self.section4View setAutoresizingMask:UIViewAutoresizingFlexibleWidth|
     UIViewAutoresizingFlexibleHeight|
     UIViewAutoresizingFlexibleTopMargin|
     UIViewAutoresizingFlexibleLeftMargin];
    [view addSubview:self.section4View];
    
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.section1View setTag:SECTION_1];
    [self.section1View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)]];
    
    [self.section2View setTag:SECTION_2];
    [self.section2View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)]];
    
    [self.section3View setTag:SECTION_3];
    [self.section3View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)]];
    
    [self.section4View setTag:SECTION_4];
    [self.section4View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    switch (self.view.tag)
    {
        case STATE_NORMAL:
            break;
        case STATE_SECTION_1_EXPANDED:
            [self animateCollapseSection:self.section1View];
            break;
        case STATE_SECTION_2_EXPANDED:
            [self animateCollapseSection:self.section2View];
            break;
        case STATE_SECTION_3_EXPANDED:
            [self animateCollapseSection:self.section3View];
            break;
        case STATE_SECTION_4_EXPANDED:
            [self animateCollapseSection:self.section4View];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if (!self.tapGestureIsBeingHandled) {
        self.tapGestureIsBeingHandled = YES;
        if (sender.state == UIGestureRecognizerStateEnded) {
            // handling code
            switch (sender.view.tag) {
                case SECTION_1:
                    [self animateExpandSection:self.section1View];
                    break;
                case SECTION_2:
                    [self animateExpandSection:self.section2View];
                    break;
                case SECTION_3:
                    [self animateExpandSection:self.section3View];
                    break;
                case SECTION_4:
                    [self animateExpandSection:self.section4View];
                    break;
            }
        }
    }
}

- (void)animateExpandSection:(UIView *)section
{
    switch (section.tag) {
        case SECTION_1:
            [self.view setTag:STATE_SECTION_1_EXPANDED];
            break;
        case SECTION_2:
            [self.view setTag:STATE_SECTION_2_EXPANDED];
            break;
        case SECTION_3:
            [self.view setTag:STATE_SECTION_3_EXPANDED];
            break;
        case SECTION_4:
            [self.view setTag:STATE_SECTION_4_EXPANDED];
            break;
    }
    [UIView animateWithDuration:self.animationDuration
                     animations:^() {
                         [self.view bringSubviewToFront:section];
                         [section setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                         [section setFrame:self.view.bounds];
                     }
                     completion:^(BOOL finished) {
                         UIViewController *sectionController = [[[self.dataSource objectAtIndex:section.tag] alloc] init];
                         [self.navigationController pushViewController:sectionController
                                                              animated:NO];
                         self.tapGestureIsBeingHandled = NO;
                     }];
}

- (void)animateCollapseSection:(UIView *)section
{
    CGRect sectionFrame;
    
    switch (section.tag) {
        case SECTION_1:
            sectionFrame = [self section1Frame];
            break;
        case SECTION_2:
            sectionFrame = [self section2Frame];
            break;
        case SECTION_3:sectionFrame = [self section3Frame];
            break;
        case SECTION_4:
            sectionFrame = [self section4Frame];
            break;
    }
    [UIView animateWithDuration:self.animationDuration
                     animations:^() {
                         [self.view bringSubviewToFront:section];
                         [section setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
                         [section setFrame:sectionFrame];
                     }
                     completion:^(BOOL finished) {
                         [self.view setTag:STATE_NORMAL];
                     }];
}

- (CGRect)section1Frame {
    return CGRectMake(0,
                      0,
                      self.view.bounds.size.width/2.0,
                      self.view.bounds.size.height/2.0);
}

- (CGRect)section2Frame {
    return CGRectMake(self.view.bounds.size.width/2.0,
                      0,
                      self.view.bounds.size.width/2.0,
                      self.view.bounds.size.height/2.0);
}

- (CGRect)section3Frame {
    return CGRectMake(0,
               self.view.bounds.size.height/2.0,
               self.view.bounds.size.width/2.0,
               self.view.bounds.size.height/2.0);
}

- (CGRect)section4Frame {
    return CGRectMake(self.view.bounds.size.width/2.0,
                      self.view.bounds.size.height/2.0,
                      self.view.bounds.size.width/2.0,
                      self.view.bounds.size.height/2.0);
}

@end
