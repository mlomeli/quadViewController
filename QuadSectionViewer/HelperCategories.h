//
//  RotationCategories.h
//  QuadSectionViewer
//
//  Created by Miguel Ángel Lomelí Cantú on 1/5/13.
//  Copyright (c) 2013 Miguel Ángel Lomelí Cantú. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NSObject (logDescriptionCategory)
- (void) logDescription;
@end

@implementation NSObject (logDescriptionCategory)

- (void) logDescription
{
    NSString * className = NSStringFromClass([self class]);
    NSLog(@"%@ : %@ ;", className, [self description]);
}

@end

// For orientation issues on iOs6

@interface UINavigationController(Rotation)

@end

@implementation UINavigationController(Rotation)

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
    return [self.topViewController supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

@end

@interface UIViewController(Rotation)

@end


@implementation UIViewController(Rotation)

-(NSUInteger)supportedInterfaceOrientations
{
    NSUInteger ret = 0;
    
    if ( [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait] ) {
        ret |= UIInterfaceOrientationMaskPortrait;
    }
    if ( [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown] ) {
        ret |= UIInterfaceOrientationMaskPortraitUpsideDown;
    }
    if ( [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft] ) {
        ret |= UIInterfaceOrientationMaskLandscapeLeft;
    }
    if ( [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight] ) {
        ret |= UIInterfaceOrientationMaskLandscapeRight;
    }
    
    return ret;
}

-(BOOL)shouldAutorotate
{
    return YES;
}
@end


@interface UIColor(Random)
+ (UIColor*) randomColor;
@end


@implementation UIColor(Random)

+ (UIColor*) randomColor
{
    CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


@end

@interface UIImage (imageWithColor)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithVerticalGradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withDimensions:(CGSize)dimensions;
@end

@implementation UIImage (imageWithColor)

/**
 * Creates an image 1x1 with a solid color, to create backgrounds for buttons
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithVerticalGradientFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor withDimensions:(CGSize)dimensions
{
    /* Create a Core Graphics Image context with the width and height of the progress bar button
     and push this context on the stack.  At this point, the image is clearColored. */
    UIGraphicsBeginImageContext(dimensions);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    // Create a gradient
    const CGFloat *c1 = CGColorGetComponents(fromColor.CGColor);
    const CGFloat *c2 = CGColorGetComponents(toColor.CGColor);
    CGFloat colors [] = {
        c1[0], c1[1], c1[2], c1[3],
        c2[0], c2[1], c2[2], c2[3]
    };
    
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    
    CGPoint startPoint = CGPointMake(0,0);
    CGPoint endPoint = CGPointMake(0,dimensions.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient), gradient = NULL;
    
    /* Now we can remove the graphic context from the stack, retrieve the freshly created UIImage and of course, release the Core Graphics image context we created at first. */
    UIGraphicsPopContext();
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end

@interface UIView (Additions)
    @property (nonatomic) CGFloat left;
    @property (nonatomic) CGFloat top;
    @property (nonatomic) CGFloat right;
    @property (nonatomic) CGFloat bottom;
    @property (nonatomic) CGFloat width;
    @property (nonatomic) CGFloat height;
@end

@implementation UIView (Additions)

- (CGFloat)left {
    
    return self.frame.origin.x;
    
}

- (void)setLeft:(CGFloat)x {
    
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}

- (CGFloat)top {
    
    return self.frame.origin.y;
    
}

- (void)setTop:(CGFloat)y {
    
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}

- (CGFloat)right {
    
    return self.frame.origin.x + self.frame.size.width;
    
}

- (void)setRight:(CGFloat)right {
    
    CGRect frame = self.frame;
    
    frame.origin.x = right - frame.size.width;
    
    self.frame = frame;
    
}

- (CGFloat)bottom {
    
    return self.frame.origin.y + self.frame.size.height;
    
}

- (void)setBottom:(CGFloat)bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = bottom - frame.size.height;
    
    self.frame = frame;
    
}

- (CGFloat)width {
    
    return self.frame.size.width;
    
}

- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}

- (CGFloat)height {
    
    return self.frame.size.height;
    
}

- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}

@end

//