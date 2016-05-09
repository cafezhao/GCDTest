//
//  FitstViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/2.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "QueueViewController.h"

@implementation QueueViewController
{
    UILabel * _timerLab;
    NSUInteger _times;
    
    UIImageView * _imageView1;
    UIImageView * _imageView2;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
//    dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue = dispatch_queue_create("testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"Begin Block 1, CurThread:%@", [NSThread currentThread]);
        
        UIImage * image;
        for (int i = 0; i < 10000; i++)
        {
            image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_0376" ofType:@"jpg"]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_imageView1 setImage:image];
            
        });
        
        NSLog(@"End Block 1");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"Beigin Block 2, CurThread:%@", [NSThread currentThread]);
        
        UIImage * image;
        for (int i = 0; i < 1000; i++)
        {
            image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_1169" ofType:@"jpg"]];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_imageView2 setImage:image];
            
        });
        
        NSLog(@"End Block 2");
    });
    
    _times = 0;
    _timerLab = [[UILabel alloc] initWithFrame:self.view.bounds];
    [_timerLab setTextAlignment:NSTextAlignmentCenter];
    [_timerLab setText:[@(_times) stringValue]];
    [self.view addSubview:_timerLab];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64,
                                                                self.view.bounds.size.width / 2,
                                                                (self.view.bounds.size.width / 2) * 3 / 4)];
    [self.view addSubview:_imageView1];
    
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 64,
                                                                self.view.bounds.size.width / 2,
                                                                (self.view.bounds.size.width / 2) * 3 / 4)];
    [self.view addSubview:_imageView2];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerFunc:) userInfo:nil repeats:YES];
}

- (void)timerFunc:(NSTimer *)timer
{
    _times++;
    [_timerLab setText:[@(_times) stringValue]];
}

@end
