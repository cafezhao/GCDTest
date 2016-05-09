//
//  GroupViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/3.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "GroupViewController.h"

@implementation GroupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    [self notify];
//    [self wait];
    [self enter];
}

- (void)notify
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue1 = dispatch_queue_create("testGroup", DISPATCH_QUEUE_SERIAL);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^(){
        NSLog(@"dispatch-1");
    });
    dispatch_group_async(group, queue, ^(){
        NSLog(@"dispatch-2");
    });
    dispatch_group_async(group, queue, ^(){
        NSLog(@"dispatch-3");
    });
    dispatch_group_async(group, queue, ^(){
        NSLog(@"dispatch-4");
    });
    dispatch_group_async(group, queue, ^(){
        NSLog(@"dispatch-5");
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
}

- (void)wait
{
    dispatch_queue_t aDQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    // Add a task to the group
    dispatch_group_async(group, aDQueue, ^{
        printf("task 1 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 2 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 3 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 4 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 5 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 6 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 7 \n");
    });
    printf("wait 1 2 3 \n");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    printf("task 1 2 3 finished \n");
    
    group = dispatch_group_create();
    // Add a task to the group
    dispatch_group_async(group, aDQueue, ^{
        printf("task 4 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 5 \n");
    });
    dispatch_group_async(group, aDQueue, ^{
        printf("task 6 \n");
    });
    printf("wait 4 5 6 \n");
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    printf("task 4 5 6 finished \n");
    
}

- (void)enter
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_notify(group, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^(){
        NSLog(@"dispatch-1");
        
        dispatch_group_leave(group);
    });
    
    dispatch_async(queue, ^(){
        NSLog(@"dispatch-2");
    });
    
    dispatch_async(queue, ^(){
        NSLog(@"dispatch-3");
    });
    
    dispatch_async(queue, ^(){
        NSLog(@"dispatch-4");
    });
    
    dispatch_async(queue, ^(){
        NSLog(@"dispatch-5");
    });
}

@end
