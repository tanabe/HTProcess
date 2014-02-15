//
//  HTProcess.m
//  HTProcess
//
//  Created by tanabe on 2014/02/15.
//  Copyright (c) 2014年 Hideaki Tanabe. All rights reserved.
//

#import "HTProcess.h"

@interface HTProcess()
@property (nonatomic, strong) ProcessBlock processBlock;
@property (nonatomic, strong) HTProcess *nextProcess;
@property (nonatomic, strong) NSMutableDictionary *result;
@end

@implementation HTProcess

+ (HTProcess *)create:(ProcessBlock)processBlock {
    HTProcess *process = [[HTProcess alloc] init];
    process.processBlock = processBlock;
    return process;
}

- (void)run:(NSMutableDictionary *)result {
    _processBlock(_nextProcess, result);
}

- (HTProcess *)bind:(HTProcess *)process {
    _nextProcess = process;
    return self;
}

@end
