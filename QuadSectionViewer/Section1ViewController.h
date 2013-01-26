//
//  Section1ViewController.h
//  QuadSectionViewer
//
//  Created by Adrián García Betancourt on 25/01/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuadViewController.h"

@interface Section1ViewController : UIViewController <QuadViewControllerDataSource>

+ (UIView *)controllerView;

@end
