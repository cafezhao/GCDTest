//
//  ListViewController.m
//  GCDTest
//
//  Created by 赵露 on 15/8/2.
//  Copyright (c) 2015年 赵露. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController
{
    NSArray * _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataArray = @[@"QueueViewController", @"GroupViewController", @"ApplyViewController", @"SemaphoreViewController", @"SourceViewController"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [cell.textLabel setText:_dataArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class curClass = NSClassFromString(_dataArray[indexPath.row]);
    UIViewController * vc = [[curClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
