//
//  UIImage+CMB.h
//  hmsapp
//
//  Created by Damon on 16/10/21.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (CMB)

/**
 *  图片拉伸
 */
+ (UIImage *)resizedImage:(NSString *)name;

+ (UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;
+ (UIImage *)resizeImage:(UIImage*)originalImage withScale:(float)scale;

+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
