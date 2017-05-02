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
#import "AppDelegate.h"
#import "CMBPopViewModel.h"


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
@property (nonatomic, strong)CMBPopViewModel * popModel;


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
    
    UIButton * imgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imgButton.frame = _alertView.bounds;
    NSData * imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgUrlStr]];
    UIImage * img = [UIImage imageWithData:imgData];
    [imgButton setImage:img forState:UIControlStateNormal];
    [imgButton addTarget:self action:@selector(imgClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_alertView addSubview:imgButton];
    
    
    //取消按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.x = CGRectGetMidX(_alertView.frame)-GetLogicPixelX(30);
    closeBtn.y = CGRectGetMaxY(_alertView.frame)+GetLogicPixelY(60);
    closeBtn.w = GetLogicPixelX(60);
    closeBtn.h = GetLogicPixelY(60);
    
    [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.tag = 0;
    [self addSubview:closeBtn];

}

-(NSString *)imgUrlStr {
    
    if (_imgUrlStr == nil) {
        
        _imgUrlStr = @"http://ocpnags04.bkt.clouddn.com/logo114.png";
    }
    
    return _imgUrlStr;
}



#pragma mark- 关闭按钮点击
-(void)buttonClick:(UIButton *)btn
{
//    [self dismiss];
    [self exitApplication];
    
}

#pragma mark- 图片点击
-(void)imgClicked:(UIButton*)sender {
    
    UIWebView * web = [[UIWebView alloc]initWithFrame:self.bounds];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [web loadRequest:request];
    [self addSubview:web];

    
    NSLog(@"图片被点击了");
    
}

#pragma mark- 动态弹出弹窗
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

#pragma mark- 点击其他区域关闭弹窗
- (void)handleTapBehind:(UITapGestureRecognizer *)sender
{
    
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint location = [sender locationInView:nil];
        if (![_alertView pointInside:[_alertView convertPoint:location fromView:_alertView.window] withEvent:nil]){
            [_alertView.window removeGestureRecognizer:sender];
            [self dismiss];
        }
    }  }

#pragma mark- 弹窗消失
- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        _alertView.transform = CGAffineTransformMakeScale(1.21f, 1.21f);
        _alertView.alpha = 0;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



#pragma mark- 强制关闭应用
- (void)exitApplication {
        exit(0);
}






@end
