//
//  OCSOCUtils.h
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCShellOCUtils : NSObject

+ (void)logClassMethod:(NSString *)info;

- (void)logInstanceMethod:(NSString *)info;

@end

NS_ASSUME_NONNULL_END
