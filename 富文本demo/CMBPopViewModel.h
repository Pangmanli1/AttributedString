//
//  CMBPopViewModel.h
//  富文本demo
//
//  Created by Maria_Pang on 17/4/28.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MLUserOrientType ) {
    MLUserOrientTypeAll,  //默认从0开始
    MLUserOrientTypeLogedout,
    MLUserOrientTypeBind,
    MLUserOrientTypeNotBind,
};


@interface CMBPopViewModel : NSObject


@property (nonatomic, assign)BOOL isInsured;
@property (nonatomic, copy)NSString * imgUrl;
@property (nonatomic, copy)NSString * adUrl;
@property (nonatomic, copy)NSString * fireDayInterval;
@property (nonatomic, assign)BOOL isFireEveryDay;
@property (nonatomic, assign)MLUserOrientType orientedUserType;


@end
