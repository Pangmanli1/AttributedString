//
//  CMBLogOutView.m
//  富文本demo
//
//  Created by Maria_Pang on 17/4/28.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import "CMBLogOutView.h"
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

@interface CMBLogOutView ()
@property (nonatomic, strong) UIButton *cloaseButton;     //关闭按钮
@property (nonatomic, strong) UIButton *dontHaveButton;   //没有啊按钮
@property (nonatomic, strong) UIButton *bindButton;       //关联保单按钮
@property (nonatomic, strong) UIView *backView;
@end


@implementation CMBLogOutView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setUI];
//        [TalkingData trackPageBegin:@"relation_alert"];
    }
    
    return self;
}

-(void)setUI{
    //设置背景颜色
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    
    //内容
    self.backView = [UIView new];
    
    self.backView.w = GetLogicPixelX(630);
    self.backView.h = GetLogicPixelY(718);
    self.backView.x = CHSScreenWidth/2 - self.backView.w/2;
    self.backView.y = CHSScreenHeight/2 - self.backView.h/2;
    
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 18;
    //self.backView.layer.masksToBounds = true;
    [self addSubview:self.backView];
    
    //取消按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.x = CGRectGetMidX(self.backView.frame)-GetLogicPixelX(30);
    closeBtn.y = CGRectGetMaxY(self.backView.frame)+GetLogicPixelY(60);
    closeBtn.w = GetLogicPixelX(60);
    closeBtn.h = GetLogicPixelY(60);
    
    [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.tag = 0;
//    closeBtn.hidden = NO;
    [self addSubview:closeBtn];
//    
//    //图片
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hospital_pop_pg"]];
//    [imgView sizeToFit];
//    imgView.x = self.backView.w/2.0 -  imgView.w/2.0;
//    imgView.y = (-1)*(imgView.h/3.0);
//    [self.backView addSubview:imgView];
//    
//    //第一栏
//    CGFloat y = [self createListWithYSpace:(GetLogicPixelY(36)+imgView.y+imgView.h) andImg:@"hospital_query_icon" andLabTxt:@"查询保单信息"];
//    
//    //第二栏
//    y = [self createListWithYSpace:y andImg:@"hospital_management_icon" andLabTxt:@"管理理赔进度"];
//    
//    //第三栏
//    y = [self createListWithYSpace:y andImg:@"hospital_understand_icon" andLabTxt:@"了解保险权益"];
//    
//    //第四条线
//    UIView *line4 = [UIView new];
//    line4.x = GetLogicPixelX(64);
//    line4.y = y;
//    line4.w = GetLogicPixelX(502);
//    line4.h = GetLogicPixelY(1);
//    line4.backgroundColor = [UIColor whiteColor];
//    [self.backView addSubview:line4];
//    
//    //没有按钮
//    y = line4.y + line4.h + GetLogicPixelY(42);
//    [self initBtnWithX:line4.x andY:y andTitle:@"没有啊" andTag:1];
//    
//    //管理保单按钮
//    CGFloat space = self.backView.w - 2*GetLogicPixelX(220)-2*line4.x;
//    [self initBtnWithX:(line4.x+GetLogicPixelX(220)+space) andY:y andTitle:@"关联保单" andTag:2];
    
}

-(CGFloat)createListWithYSpace: (CGFloat) y andImg:(NSString *)imgName andLabTxt:(NSString *)txt{
    UIView *line1 = [UIView new];
    line1.x = GetLogicPixelX(64);
    line1.y = y;
    line1.w = GetLogicPixelX(502);
    line1.h = GetLogicPixelY(1);
    line1.backgroundColor = [UIColor whiteColor];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
     UILabel*lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    lable.text = txt;
    [lable setFont:[UIFont systemFontOfSize:15]];
    CGSize FontSize = [lable.text boundingRectWithFont:lable.font];
    bt.x = (self.backView.w/2.0)- (FontSize.width+GetLogicPixelX(40)+GetLogicPixelX(34))/2.0;
    bt.y = line1.y+line1.h+GetLogicPixelY(24);
    bt.w = GetLogicPixelX(34);
    bt.h = GetLogicPixelY(34);
    
    lable.y = bt.center.y - FontSize.height/2.0;
    lable.x = bt.x+bt.w+GetLogicPixelX(40);
    [lable sizeToFit];
    
    [self.backView addSubview:line1];
    [self.backView addSubview:bt];
    [self.backView addSubview:lable];
    
    y = bt.y+bt.h+GetLogicPixelX(24);
    return y;
}

- (void)initBtnWithX:(CGFloat) x andY:(CGFloat) y andTitle:(NSString *) title andTag:(int)tag{
    UIButton *submitTempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitTempBtn.w = GetLogicPixelX(220);
    submitTempBtn.h = GetLogicPixelY(78);
    submitTempBtn.x = x;
    submitTempBtn.y = y;
    
    [submitTempBtn setBackgroundImage:[UIImage resizedImage:@"close"] forState:UIControlStateNormal];
    [submitTempBtn setBackgroundImage:[UIImage resizedImage:@"close"] forState:UIControlStateHighlighted];
    [submitTempBtn setBackgroundColor:[UIColor clearColor]];
    
    [submitTempBtn setTag:tag];
    [submitTempBtn setTitle:title forState:UIControlStateNormal];
    [submitTempBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [submitTempBtn.titleLabel setTextColor:[UIColor blackColor]];
    [submitTempBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:submitTempBtn];
}

-(UILabel *)createLableWithStr:(NSString *) strValue andSuperView:(UIView *) superView andColor: (int) color andSize:(int) size{
    UILabel *lab = [UILabel new];
    [lab setFont:[UIFont systemFontOfSize:size]];
    lab.text = strValue;
    lab.textColor = [UIColor blackColor];
    [lab sizeToFit];
    lab.textAlignment = NSTextAlignmentCenter;
    
    CGSize FontSize = [lab.text boundingRectWithFont:lab.font];
    lab.x = superView.w/2.0 - (FontSize.width/2);
    [superView addSubview:lab];
    return lab;
}

- (void)buttonClick:(UIButton *) button
{
    switch ( button.tag ) {
        case 0:
            [self disMissView];
            break;
            
        case 1:
        {
            [self disMissView];
            
//            //把用户期望
//            BaiYiUser *user = [[CHUserManager sharedManager] getNowUser];
//            user.m_isNotWantPopBindView = YES;
//            [[CHUserManager sharedManager] storeUserToLocal:user];
//            
//            //保存本次用户设置不弹窗时间(到1970-1-1的秒数)
//            NSDate *currentDate = [NSDate date];
//            unsigned long time= [currentDate timeIntervalSince1970];
//            [calcExpireDate updateDataIntoTable:user.UserID andTime:[NSString stringWithFormat:@"%@",@(time)]];
//            //
//            //用户统计
//            [TalkingData trackEvent:@"nopolicy_click"];
        }
            break;
            
        case 2:
            [self disMissView];
            if( self.bindProcBlock )
            {
                self.bindProcBlock();
            }
            
            //用户统计
//            [TalkingData trackEvent:@"relation_policy_click"];
            break;
            
        default:
            break;
    }
}

- (void)disMissView
{
    if( self.closeProcBlock )
    {
        self.closeProcBlock();
    }
    
    [self removeFromSuperview];
}








@end
