//
//  NSString+Manage.m
//  hmsapp
//
//  Created by Damon on 16/10/17.
//
//

#import "NSString+Manage.h"

@implementation NSString (Manage)

- (CGSize)boundingRectWithSize:(CGSize)size fontOfLabel:(UIFont *)font
{
    return [self boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]
                              context:nil].size;
}

- (CGSize)boundingRectWithFont:(UIFont *)font
{
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]
                              context:nil].size;
}

- (BOOL)isMobileNumber
{
//    NSString *MOBILE = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSString *MOBILE = @"^1[2|3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject: self];
}

- (BOOL)isLetterNumber
{
    NSString *Letter = @"^[A-Za-z0-9]+$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}


- (BOOL)isNumber
{
    NSString *Letter = @"^[0-9]*$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}

// 数字 -
- (BOOL)isNumberRail
{
    NSString *Letter = @"^[0-9,-]*$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}

- (NSString *)getPhoneNumber
{
    if (self == nil || [self isEqual:[NSNull null]]) {
        return nil;
    }
    
    BOOL isHaveNumber = NO;
    
    NSString *noneSpace = [self stringByReplacingOccurrencesOfString:@" " withString:@""];

    for (int i = 0; i < noneSpace.length; i++) {
        NSString *str = [noneSpace substringWithRange:NSMakeRange(i, 1)];
        
        if ([str isNumberRail]) {
            isHaveNumber = YES;
        }
        
        if (isHaveNumber) {
            
            if (![str isNumberRail]) {
                
                return [[noneSpace substringWithRange:NSMakeRange(0, i)] getNumber];
            }
        }
    }
    
    return [noneSpace getNumber];
}

- (NSString *)getNumber
{
    NSMutableString *mutableStr = [NSMutableString string];
    for (int i = 0; i < self.length; i++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([str isNumber]) {
            [mutableStr appendString:str];
        }
    }
    
    return mutableStr;
}

@end
