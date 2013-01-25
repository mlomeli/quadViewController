//
//  AppDelegate.h
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    RootViewController * rootViewController;
    UINavigationController * navigationController;
}

@property (strong, nonatomic) UIWindow *window;

@end
