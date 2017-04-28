//
//  CMBLabel.m
//  hmsapp
//
//  Created by Joey-pc on 16/10/26.
//
//

#import "CMBLabel.h"

@implementation CMBLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setUI];
    }
    
    return self;
}

-(void)setUI{
    //打开交互
    self.textColor = [UIColor blackColor];
    self.userInteractionEnabled = YES;
    [self setupTap];
}

#pragma mark - UITapGestureRecognizer(点按)
-(void)setupTap
{
    //创建手势识别实例
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.delegate = self;
    
    //将手势识别附加到指定的视图之上
    [self addGestureRecognizer:tap];
}

//编写手势触发监听方法
-(void)tap:(UITapGestureRecognizer *) recognizer
{
    NSLog(@"lable 被点击了");
    if( self.clickProcBlock )
    {
        self.clickProcBlock();
    }
}
@end
