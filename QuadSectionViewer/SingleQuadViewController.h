//
//  SingleQuadViewController.h
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "SingleViewControllerDelegate.h"
@interface SingleQuadViewController : UIViewController <SingleViewControllerDelegate>

- (UIView*) getMiniView;

@end
