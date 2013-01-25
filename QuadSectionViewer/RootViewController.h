//
//  RootViewController.h
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "RootView.h"
#import "SingleViewControllerDelegate.h"

@interface RootViewController : UIViewController
{
   // RootView * _rootView;
    NSArray * _viewControllers;
}
//@property(nonatomic,strong) RootView * rootView;
- (id)initWithViewControllers: (NSMutableArray*) viewControllers;
//- (void) setViewControllers:(NSMutableArray *)viewControllers;
@end

