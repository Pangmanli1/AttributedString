//
//  MLNetManager.h
//  POSTdemo
//
//  Created by 332211 on 16/8/17.
//  Copyright © 2016年 shangCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLNetManager : NSObject

+(instancetype)sharedManager;

/**
 不需传参的get请求

 @param url        URL
 @param completion 返回的id类型数据
 */
- (void)getDataWithUrl:(NSURL*)url andFinishedBlock:(void (^)(id responseDic, NSError *error))completion;


//需要传token的接口
-(void)postDataWithDic:(NSMutableDictionary *)innerDic Token:(NSString *)token URLStr:(NSString*)urlStr FinishedBlock:(void (^)(id response , NSError* error))completion;


@end



