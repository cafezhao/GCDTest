//
//  SourceViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/3.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "SourceViewController.h"

@implementation SourceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self run];
}

- (void)run
{
    //GCD定时器
    dispatch_source_t timer=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 2ull*NSEC_PER_SEC), DISPATCH_TIME_FOREVER, 1ull*NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"wakeup");
        dispatch_source_cancel(timer);
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"cancel");
    });
    //启动
    dispatch_resume(timer);
}

@end
