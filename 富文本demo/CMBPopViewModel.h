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


@interface CMBPopViewModel : NSObject<NSCoding>

@property (nonatomic, copy)NSString * type;
@property (nonatomic, copy)NSString * imageUrl;
@property (nonatomic, copy)NSString * loadUrl;
@property (nonatomic, copy)NSString * startDate;
@property (nonatomic, copy)NSString * endDate;
@property (nonatomic, copy)NSString * user;

@property (nonatomic, assign)MLUserOrientType userType;


@end
