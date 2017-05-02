//
//  MLNetManager.m
//  POSTdemo
//
//  Created by 332211 on 16/8/17.
//  Copyright © 2016年 shangCheng. All rights reserved.
//

#import "MLNetManager.h"


@implementation MLNetManager


+(instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    
    static MLNetManager* manager;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[MLNetManager alloc]init];
        
    });
    
    return manager;
    
}


#pragma mark- 不需要传参数的get请求
- (void)getDataWithUrl:(NSURL*)url andFinishedBlock:(void (^)(id responseDic, NSError *error))completion
{
    // 获得NSURLSession对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 请求方法
    request.HTTPMethod = @"GET";
    
    // 创建URLSessionDataTask任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //执行回调block
        if( completion != nil )
        {
            if (error == nil ) {
                //解析json数据
                NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                completion(array, nil);
            }
            else
            {
                completion(nil, error);
            }
            
        }
    }];
    
    // 启动任务
    [task resume];
}

#pragma mark- 需要传token的接口
-(void)postDataWithDic:(NSMutableDictionary *)innerDic Token:(NSString *)token URLStr:(NSString*)urlStr FinishedBlock:(void (^)(id response , NSError* error))completion
{
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    request.HTTPMethod = @"POST";
    
    NSMutableDictionary* externDic = [NSMutableDictionary dictionary];
    
    externDic[@"token"] = token;
    externDic[@"data"] = innerDic;
    
    //json 解析
    NSData* data = [NSJSONSerialization dataWithJSONObject:externDic options:NSJSONWritingPrettyPrinted error:nil];
    //把json数据转化为 字符串
    NSString* dataStr = [[NSString alloc]initWithData:data  encoding:NSUTF8StringEncoding];
    //拼接完整字符串
    NSString* strBody = [NSString stringWithFormat:@"d=%@",dataStr];
    
    request.HTTPBody = [strBody dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //执行回调block
        if( completion != nil )
        {
            if (error == nil ) {
                //解析json数据
                NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                completion(array, nil);
            }
            else
            {
                completion(nil, error);
            }
            
        }
    }];
    // 启动任务
    [task resume];
    
    
}




@end
