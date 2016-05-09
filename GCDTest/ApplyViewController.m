//
//  ApplyViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/2.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "ApplyViewController.h"

@implementation ApplyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSArray *array = [NSArray arrayWithObjects:@"aaa",
                      @"bbb",
                      @"ccc",
                      @"ddd",
                      @"eee",
                      nil];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^()
    {
        NSLog(@"start");
        dispatch_apply([array count], dispatch_get_global_queue(0, 0), ^(size_t index)
        {
            NSLog(@"index:%zu, content:%@, thread:%@", index, array[index], [NSThread currentThread]);
        });
        NSLog(@"done");
    });
}

@end
