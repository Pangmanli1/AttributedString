//
//  CMBPopViewModelArchiver.m
//  富文本demo
//
//  Created by Maria_Pang on 17/5/2.
//  Copyright © 2017年 Maria.Pang. All rights reserved.
//

#import "CMBPopViewModelArchiver.h"

#define   PopViewModelFile  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"CMBPopViewModelFile.data"]

@implementation CMBPopViewModelArchiver

+ (instancetype)shareArchiver{
    
    static dispatch_once_t onceToken;
    
    static CMBPopViewModelArchiver * popModel = nil;
    dispatch_once(&onceToken, ^{
        
        popModel = [[self alloc]init];
    });
    
    return popModel;
    
}
- (void)savePopViewModel:(CMBPopViewModel *)model{
    
    [NSKeyedArchiver archiveRootObject:model toFile:PopViewModelFile];
    
}
- (CMBPopViewModel *)getPopViewModel{
    
    CMBPopViewModel* popModel = [NSKeyedUnarchiver unarchiveObjectWithFile:PopViewModelFile];
    
    if (!popModel) {
        popModel = [[CMBPopViewModel alloc]init];
    }
    
    return popModel;
    
}
- (void)clearData{
    
    CMBPopViewModel * data = [[CMBPopViewModel alloc]init];
    
    [NSKeyedArchiver archiveRootObject:data toFile:PopViewModelFile];
    
    
    
}



@end
