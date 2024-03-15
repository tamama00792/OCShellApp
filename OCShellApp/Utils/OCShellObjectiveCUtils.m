//
//  OCSOCUtils.m
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

#import "OCShellObjectiveCUtils.h"

@implementation OCShellObjectiveCUtils

+ (void)logClassMethod:(NSString *)info {
    NSLog(@"%s:%@",__func__,info);
}

- (void)logInstanceMethod:(NSString *)info {
    NSLog(@"%s:%@",__func__,info);
}

@end
