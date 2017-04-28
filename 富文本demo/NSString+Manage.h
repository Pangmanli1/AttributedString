//
//  NSString+Manage.h
//  hmsapp
//
//  Created by Damon on 16/10/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Manage)

- (CGSize)boundingRectWithSize:(CGSize)size fontOfLabel:(UIFont *)font;

- (CGSize)boundingRectWithFont:(UIFont *)font;


/**
 校验手机号
 */
- (BOOL)isMobileNumber;

/**
 校验数字和字母
 */
- (BOOL)isLetterNumber;

/**
 提取电话号码
 */
- (NSString *)getPhoneNumber;

- (BOOL)isNumberRail;

@end
