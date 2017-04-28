//
//  UIView+CZFrame.m
//  tool
//
//  Created by Joey-pc on 16/2/18.
//  Copyright © 2016年 Joey-pc. All rights reserved.
//

#import "UIView+CZFrame.h"

@implementation UIView (CZFrame)
//set方法
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}

//get方法
- (CGFloat)x
{
    return self.frame.origin.x;
}


//set方法
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

//get方法
- (CGFloat)y
{
    return self.frame.origin.y;
}


//set方法
- (void)setW:(CGFloat)w
{
    CGRect frame = self.frame;
    
    frame.size.width = w;
    
    self.frame = frame;
}

//get方法
- (CGFloat)w
{
    return self.frame.size.width;
}


//set方法
- (void)setH:(CGFloat)h
{
    CGRect frame = self.frame;
    
    frame.size.height = h;
    
    self.frame = frame;
}

//get方法
- (CGFloat)h
{
    return self.frame.size.height;
}

@end
