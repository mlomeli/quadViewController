//
//  RootView.h
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootView : UIView
{
    UIView * _number1;
    UIView * _number2;
    UIView * _number3;
    UIView * _number4;
}
@property (strong) UIView * number1;
@property (strong) UIView * number2;
@property (strong) UIView * number3;
@property (strong) UIView * number4;

- (id)initWithFrame:(CGRect)frame andArrayOfViews: (NSArray*) viewsArray;

@end
