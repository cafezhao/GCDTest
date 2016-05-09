//
//  SemaphoreViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/3.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "SemaphoreViewController.h"

@implementation SemaphoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self semaphore];
}

//   dispatch_semaphore_signal的返回值为long类型，当返回值为0时表示当前并没有线程等待其处理的信号量，其处理
//
//　　的信号量的值加1即可。当返回值不为0时，表示其当前有（一个或多个）线程等待其处理的信号量，并且该函数唤醒了一
//
//　　个等待的线程（当线程有优先级时，唤醒优先级最高的线程；否则随机唤醒）。
//
//　　dispatch_semaphore_wait的返回值也为long型。当其返回0时表示在timeout之前，该函数所处的线程被成功唤醒。
//
//　　当其返回不为0时，表示timeout发生。
- (void)semaphore
{
    BOOL condition = YES;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(queue, ^{ //消费者队列
        while (condition) {
            dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
            NSLog(@"消费一个");
            //得到数据
        }
    });
    dispatch_async(queue, ^{ //生产者队列
        while (condition) {
            sleep(5);
            NSLog(@"生产一个");
            dispatch_semaphore_signal(sem);
        }
    });
}

@end
