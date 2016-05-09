//
//  Aspect-List.m
//  GCDTest
//
//  Created by zhaolu on 15/8/1.
//  Copyright (c) 2015年 zhaolu. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "ListViewController.h"

#define AtAspect List

#define AtAspectOfClass AppDelegate

@classPatchField(AppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ListViewController * vc = [[ListViewController alloc] init];
    UINavigationController * naviVc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = naviVc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return XAMessageForward(application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions);
    
}

@end

#undef AtAspectOfClass
#undef AtAspect
