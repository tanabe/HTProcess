//
//  HTProcess.h
//  HTProcess
//
//  Created by tanabe on 2014/02/15.
//  Copyright (c) 2014年 Hideaki Tanabe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTProcess;

typedef void (^ProcessBlock)(HTProcess *next, NSMutableDictionary *result);

@interface HTProcess : NSObject
+ (HTProcess *)create:(ProcessBlock)processBlock;
- (HTProcess *)bind:(HTProcess *)process;
- (void)run:(NSMutableDictionary *)result;

@end
