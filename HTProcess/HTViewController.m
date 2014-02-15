//
//  HTViewController.m
//  HTProcess
//
//  Created by tanabe on 2014/02/15.
//  Copyright (c) 2014年 Hideaki Tanabe. All rights reserved.
//

#import "HTViewController.h"
#import "HTProcess.h"

@interface HTViewController ()

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    HTProcess *p1 = [HTProcess create:^(HTProcess *next, NSMutableDictionary *result) {
        NSLog(@"p1");
        [next run:result];
    }];
    
    HTProcess *p2 = [HTProcess create:^(HTProcess *next, NSMutableDictionary *result) {
        NSLog(@"p2 %@", result[@"message"]);
        [next run:result];
    }];
    
    [p1 bind:p2];
    [p1 run:[[NSMutableDictionary alloc] initWithDictionary:@{@"message": @"hello"}]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
