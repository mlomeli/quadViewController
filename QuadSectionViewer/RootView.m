//
//  RootView.m
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import "RootView.h"

@implementation RootView
@synthesize number1 = _number1;
@synthesize number2 = _number2;
@synthesize number3 = _number3;
@synthesize number4 = _number4;


- (id)initWithFrame:(CGRect)frame andArrayOfViews: (NSArray*) viewsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        int controllerCount = 0;
        for (UIView * view in viewsArray) {
            switch (controllerCount) {
                case 0:
                    _number1 = view;
                    break;
                case 1:
                    _number2 = view;
                    break;
                case 2:
                    _number3 = view;
                    break;
                case 3:
                    _number4 = view;
                    break;
                    
                default:
                    break;
            }
            controllerCount++;
        }
        //createViews
        [self layoutIfNeeded];
        [self addSubview:_number1];
        [self addSubview:_number2];
        [self addSubview:_number3];
        [self addSubview:_number4];
    }
    return self;
}




- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat quadViewWidth = self.frame.size.width/2;
    CGFloat quadViewHeight = self.frame.size.height/2;

    _number1.frame = CGRectMake(0, 0, quadViewWidth, quadViewHeight);
    _number2.frame = CGRectMake(quadViewWidth, 0, quadViewWidth, quadViewHeight);
    _number3.frame = CGRectMake(0, quadViewHeight, quadViewWidth, quadViewHeight);
    _number4.frame = CGRectMake(quadViewWidth, quadViewHeight, quadViewWidth, quadViewHeight);
    
}


//{
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
