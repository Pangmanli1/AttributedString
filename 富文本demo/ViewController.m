//
//  ViewController.m
//  富文本demo
//
//  Created by Maria.Pang on 17/4/23.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import "ViewController.h"
#define GetLogicPixelX(value) ((CHSScreenWidth/LOGIC_DEVICE_WIDTH)*(value))
#define GetLogicPixelY(value) ((CHSScreenHeight/LOGIC_DEVICE_HEIGHT)*(value))
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define CHSScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define CHSScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define LOGIC_DEVICE_WIDTH   (750)
#define LOGIC_DEVICE_HEIGHT  (1334)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //方法一
    [self createShareView];
    
    //方法二
//    [self createStepShareView];




}

- (void)createShareView
{
    int steps = 5889;
    int distance = 50000;
    int calorie = 8000;
    float km = distance/1000.0;
    
    
    CGFloat margin = GetLogicPixelX(32);
    CGFloat gapY = GetLogicPixelX(20);
    CGFloat lblW = GetLogicPixelX(686/3.f);
    CGFloat iconH = GetLogicPixelY(34);
    CGFloat lblH = GetLogicPixelX(48+12);
    CGFloat lblY = self.view.frame.size.height - GetLogicPixelY(32+iconH+gapY+lblH)-GetLogicPixelY(64)-GetLogicPixelY(80);
    
    // **用户
    UILabel * userLbl = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin+64, 280, iconH)];
    [userLbl setLineBreakMode:NSLineBreakByWordWrapping];
    userLbl.numberOfLines = 0;
    [userLbl setBackgroundColor:[UIColor clearColor]];
    [userLbl setFont:[UIFont systemFontOfSize:18]];
    [userLbl setTextColor:[UIColor whiteColor]];
    [userLbl setTextAlignment:NSTextAlignmentLeft];
    [userLbl setText:@"用户名"];
    [self.view addSubview:userLbl];
    
    // 日期
    UILabel * dateLbl = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin+GetLogicPixelY(34+18)+64, 280, iconH)] ;
    [dateLbl setBackgroundColor:[UIColor clearColor]];
    [dateLbl setFont:[UIFont systemFontOfSize:11.5]];
    [dateLbl setTextColor:[UIColor whiteColor]];
    [dateLbl setText:@"2017/04/22"];
    [dateLbl setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:dateLbl];
    
    //数值labels
    UILabel * stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, lblY, lblW, lblH)];
    [stepLabel setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel.numberOfLines = 0;
    [stepLabel setTextAlignment:NSTextAlignmentCenter];
    NSString * stepStr = [NSString stringWithFormat:@"%d",steps];
    stepLabel.attributedText = [self stringWithNum:stepStr Text:@"步" andImgName:nil];;
    [self.view addSubview:stepLabel];
    
    
    UILabel * stepLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(lblW, lblY, lblW, lblH)];
    [stepLabel2 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel2.numberOfLines = 0;
    [stepLabel2 setTextAlignment:NSTextAlignmentCenter];
    NSString * calorieStr = [NSString stringWithFormat:@"%d",calorie];
    stepLabel2.attributedText = [self stringWithNum:calorieStr Text:@"大卡" andImgName:nil];
    [self.view addSubview:stepLabel2];
    
    UILabel * stepLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(2*lblW, lblY, lblW, lblH)];
    [stepLabel3 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel3.numberOfLines = 0;
    [stepLabel3 setTextAlignment:NSTextAlignmentCenter];
    NSString * mileStr = [NSString stringWithFormat:@"%.2f",km];
    stepLabel3.attributedText = [self stringWithNum:mileStr Text:@"公里" andImgName:nil];
    [self.view addSubview:stepLabel3];
    
    //带图标labels
    UILabel * stepLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(0, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel4 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel4.numberOfLines = 0;
    [stepLabel4 setTextAlignment:NSTextAlignmentCenter];
    stepLabel4.attributedText = [self stringWithNum:nil Text:@"步数" andImgName:@"icon_food01.png"];
    [self.view addSubview:stepLabel4];
    
    
    UILabel * stepLabel5 = [[UILabel alloc]initWithFrame:CGRectMake(lblW, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel5 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel5.numberOfLines = 0;
    [stepLabel5 setTextAlignment:NSTextAlignmentCenter];
    stepLabel5.attributedText = [self stringWithNum:nil Text:@"卡路里" andImgName:@"icon_food02.png"];
    [self.view addSubview:stepLabel5];
    
    UILabel * stepLabel6 = [[UILabel alloc]initWithFrame:CGRectMake(2*lblW, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel6 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel6.numberOfLines = 0;
    [stepLabel6 setTextAlignment:NSTextAlignmentCenter];
    stepLabel6.attributedText = [self stringWithNum:nil Text:@"公里数" andImgName:@"icon_food03.png"];
    [self.view addSubview:stepLabel6];
    
}



#pragma mark - 创建富文本
- (NSAttributedString *)stringWithNum:(NSString*)num Text:(NSString *) str andImgName:(NSString*)name{
    // 创建一个富文本
    
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    if (name && name.length > 0) {
        
        [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, str.length)];
        [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(0, str.length)];
        
        // 添加图片
        NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
        attchImage.image = [UIImage imageNamed:name];
        attchImage.bounds = CGRectMake(0, 0, GetLogicPixelY(34), GetLogicPixelY(34));
        NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
        [attriStr insertAttributedString:stringImage atIndex:0];
        
    }else {
        
        NSMutableAttributedString * attriStr1 = [[NSMutableAttributedString alloc] initWithString:num];
        NSMutableAttributedString * attriStr2 = [[NSMutableAttributedString alloc] initWithString:str];
        
        //数字
        [attriStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, num.length)];
        [attriStr1 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, num.length)];
        //文字
        [attriStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, str.length)];
        [attriStr2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(0, str.length)];
        
        [attriStr1 appendAttributedString:attriStr2];

        attriStr = attriStr1;
    }
    
    return attriStr;
}

- (void)createStepShareView
{
    int steps = 5889;
    int distance = 50000;
    int calorie = 8000;
    float km = distance/1000.0;
    
    
    CGFloat margin = GetLogicPixelX(32);
    CGFloat gapY = GetLogicPixelX(20);
    CGFloat lblW = GetLogicPixelX(686/3.f);
    CGFloat iconH = GetLogicPixelY(34);
    CGFloat lblH = GetLogicPixelX(48+12);
    CGFloat lblY = self.view.frame.size.height - GetLogicPixelY(32+iconH+gapY+lblH)-GetLogicPixelY(64);
    
    // **用户
    UILabel * userLbl = [[UILabel alloc]initWithFrame:CGRectMake(margin, margin+64, 280, iconH)];
    [userLbl setLineBreakMode:NSLineBreakByWordWrapping];
    userLbl.numberOfLines = 0;
    [userLbl setBackgroundColor:[UIColor clearColor]];
    [userLbl setFont:[UIFont systemFontOfSize:18]];
    [userLbl setTextColor:[UIColor whiteColor]];
    [userLbl setTextAlignment:NSTextAlignmentLeft];
    [userLbl setText:@"用户名"];
    [self.view addSubview:userLbl];
    
    // 日期
    UILabel * dateLbl = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin+GetLogicPixelY(34+18)+64, 280, iconH)] ;
    [dateLbl setBackgroundColor:[UIColor clearColor]];
    [dateLbl setFont:[UIFont systemFontOfSize:11.5]];
    [dateLbl setTextColor:[UIColor whiteColor]];
    [dateLbl setText:@"2017/04/22"];
    [dateLbl setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:dateLbl];
    
    //数值labels
    UILabel * stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, lblY, lblW, lblH)];
    [stepLabel setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel.numberOfLines = 0;
    [stepLabel setTextAlignment:NSTextAlignmentCenter];
    NSString * stepStr = [NSString stringWithFormat:@"%d步",steps];
    
    NSMutableAttributedString * attriStr0 = [[NSMutableAttributedString alloc] initWithString:stepStr];
    [attriStr0 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, stepStr.length)];
    [attriStr0 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, stepStr.length-2)];
    [attriStr0 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(stepStr.length-1,1)];
    
    stepLabel.attributedText = attriStr0;
    [self.view addSubview:stepLabel];
    
    
    UILabel * stepLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(lblW, lblY, lblW, lblH)];
    [stepLabel2 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel2.numberOfLines = 0;
    [stepLabel2 setTextAlignment:NSTextAlignmentCenter];
    NSString * calorieStr = [NSString stringWithFormat:@"%d大卡",calorie];
    
    NSMutableAttributedString * attriStr2 = [[NSMutableAttributedString alloc] initWithString:calorieStr];
    [attriStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, calorieStr.length)];
    [attriStr2 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, calorieStr.length-3)];
    [attriStr2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(calorieStr.length-2,2)];
    
    stepLabel2.attributedText = attriStr2;
    [self.view addSubview:stepLabel2];
    
    UILabel * stepLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(2*lblW, lblY, lblW, lblH)];
    [stepLabel3 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel3.numberOfLines = 0;
    [stepLabel3 setTextAlignment:NSTextAlignmentCenter];
    NSString * mileStr = [NSString stringWithFormat:@"%.2f公里",km];
    
    NSMutableAttributedString * attriStr3 = [[NSMutableAttributedString alloc] initWithString:mileStr];
    [attriStr3 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, mileStr.length)];
    [attriStr3 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, mileStr.length-3)];
    [attriStr3 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(mileStr.length-2,2)];
    
    stepLabel3.attributedText = attriStr3;
    [self.view addSubview:stepLabel3];
    
    //带图标labels
    UILabel * stepLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(0, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel4 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel4.numberOfLines = 0;
    [stepLabel4 setTextAlignment:NSTextAlignmentCenter];
    
    NSMutableAttributedString * attriStr4 = [[NSMutableAttributedString alloc] initWithString:@"步数"];
    [attriStr4 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attriStr4.length)];
    [attriStr4 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(0, attriStr4.length)];
    
    // 添加图片
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    attchImage.image = [UIImage imageNamed:@"icon_food01.png"];
    attchImage.bounds = CGRectMake(0, 0, GetLogicPixelX(34), GetLogicPixelY(34));
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attriStr4 insertAttributedString:stringImage atIndex:0];
    
    stepLabel4.attributedText = attriStr4;
    [self.view addSubview:stepLabel4];
    
    
    UILabel * stepLabel5 = [[UILabel alloc]initWithFrame:CGRectMake(lblW, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel5 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel5.numberOfLines = 0;
    [stepLabel5 setTextAlignment:NSTextAlignmentCenter];
    
    NSMutableAttributedString * attriStr5 = [[NSMutableAttributedString alloc] initWithString:@"卡路里"];
    [attriStr5 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attriStr5.length)];
    [attriStr5 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(0, attriStr5.length)];
    
    // 添加图片
    NSTextAttachment *attchImage5 = [[NSTextAttachment alloc] init];
    attchImage5.image = [UIImage imageNamed:@"icon_food02.png"];
    attchImage5.bounds = CGRectMake(0, 0, GetLogicPixelX(34), GetLogicPixelY(34));
    NSAttributedString *stringImage5 = [NSAttributedString attributedStringWithAttachment:attchImage5];
    [attriStr5 insertAttributedString:stringImage5 atIndex:0];
    
    stepLabel5.attributedText = attriStr5;
    [self.view addSubview:stepLabel5];
    
    UILabel * stepLabel6 = [[UILabel alloc]initWithFrame:CGRectMake(2*lblW, lblY+lblH+gapY, lblW, iconH)];
    [stepLabel6 setLineBreakMode:NSLineBreakByWordWrapping];
    stepLabel6.numberOfLines = 0;
    [stepLabel6 setTextAlignment:NSTextAlignmentCenter];
    
    NSMutableAttributedString * attriStr6 = [[NSMutableAttributedString alloc] initWithString:@"公里数"];
    [attriStr6 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attriStr6.length)];
    [attriStr6 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.5] range:NSMakeRange(0, attriStr6.length)];
    
    // 添加图片
    NSTextAttachment *attchImage6 = [[NSTextAttachment alloc] init];
    attchImage6.image = [UIImage imageNamed:@"icon_food02.png"];
    attchImage6.bounds = CGRectMake(0, 0, GetLogicPixelX(34), GetLogicPixelY(34));
    NSAttributedString *stringImage6 = [NSAttributedString attributedStringWithAttachment:attchImage6];
    [attriStr6 insertAttributedString:stringImage6 atIndex:0];
    
    stepLabel6.attributedText = attriStr6;
    [self.view addSubview:stepLabel6];
    
}


@end
