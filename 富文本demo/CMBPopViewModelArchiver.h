//
//  CMBPopViewModelArchiver.h
//  富文本demo
//
//  Created by Maria_Pang on 17/5/2.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMBPopViewModel.h"

@interface CMBPopViewModelArchiver : NSObject

+ (instancetype)shareArchiver;

- (void)savePopViewModel:(CMBPopViewModel *)model;

- (CMBPopViewModel *)getPopViewModel;

- (void)clearData;

@end
