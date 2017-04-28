//
//  CMBLabel.h
//  hmsapp
//
//  Created by Joey-pc on 16/10/26.
//
//

#import <UIKit/UIKit.h>

@interface CMBLabel : UILabel <UIGestureRecognizerDelegate>
@property(nonatomic, copy) void (^clickProcBlock)();
@property(nonatomic, assign) int clickFlag;

@end
