//
//  CMBLogOutView.h
//  富文本demo
//
//  Created by Maria_Pang on 17/4/28.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMBLogOutView : UIView

@property(nonatomic, copy) void (^closeProcBlock)();
@property(nonatomic, copy) void (^bindProcBlock)();

@end
