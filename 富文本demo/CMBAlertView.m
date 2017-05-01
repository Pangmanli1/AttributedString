//
//  CMBAlertView.m
//  富文本demo
//
//  Created by Maria.Pang on 17/5/2.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import "CMBAlertView.h"
#import "UIView+CZFrame.h"
#import "UIImage+CMB.h"
#import "NSString+Manage.h"

#define GetLogicPixelX(value) ((CHSScreenWidth/LOGIC_DEVICE_WIDTH)*(value))
#define GetLogicPixelY(value) ((CHSScreenHeight/LOGIC_DEVICE_HEIGHT)*(value))
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define CHSScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define CHSScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define LOGIC_DEVICE_WIDTH   (750)
#define LOGIC_DEVICE_HEIGHT  (1334)

@interface CMBAlertView ()
@property (nonatomic, strong) UIButton *cloaseButton;
@property (nonatomic, strong) UIButton *dontHaveButton;
@property (nonatomic, strong) UIButton *bindButton;
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic,strong)UITapGestureRecognizer *recognizer;

@end


@implementation CMBAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5f];
        
        [self drawView];
    }
    
    return self;
}

// 配置主视图
-(void)drawView
{
    //内容
    _alertView = [UIView new];
    
    _alertView.w = GetLogicPixelX(630);
    _alertView.h = GetLogicPixelY(718);
    _alertView.x = CHSScreenWidth/2 - _alertView.w/2;
    _alertView.y = CHSScreenHeight/2 - _alertView.h/2;
    
    _alertView.backgroundColor = [UIColor whiteColor];
    _alertView.layer.cornerRadius = 18;
    //self.backView.layer.masksToBounds = true;
    [self addSubview:_alertView];
    
    //取消按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.x = CGRectGetMidX(_alertView.frame)-GetLogicPixelX(30);
    closeBtn.y = CGRectGetMaxY(_alertView.frame)+GetLogicPixelY(60);
    closeBtn.w = GetLogicPixelX(60);
    closeBtn.h = GetLogicPixelY(60);
    
    [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.tag = 0;
    //    closeBtn.hidden = NO;
    [self addSubview:closeBtn];
    

    
    self.recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBehind:)];
    [self.recognizer setNumberOfTapsRequired:1];
    self.recognizer.cancelsTouchesInView = NO;
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:self.recognizer];
    
}





// 提交订单
-(void)buttonClick:(UIButton *)btn
{
    [self dismiss];
}

// 展示弹窗
- (void)show
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    _alertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
    _alertView.alpha = 0;
    
    [UIView animateWithDuration:.7f delay:0.f usingSpringWithDamping:.7f initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _alertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        _alertView.alpha = 1.0;
    } completion:nil];
}

// 点击其他区域关闭弹窗
- (void)handleTapBehind:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded){
        
        
        CGPoint location = [sender locationInView:[UIApplication sharedApplication].keyWindow];
        if (![_alertView pointInside:[_alertView convertPoint:location fromView:_alertView.window] withEvent:nil]){
            [_alertView.window removeGestureRecognizer:sender];
            [self dismiss];
        }
    }
}

// 隐藏弹窗
- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        _alertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
        _alertView.alpha = 0;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}








@end
