//
//  FullScreenViewController.m
//  FullScreenDemo
//
//  Created by jefferson on 2018/6/22.
//  Copyright © 2018年 jefferson. All rights reserved.
//

#import "FullScreenViewController.h"

@interface FullScreenViewController ()

@end

@implementation FullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self supportRotion:UIInterfaceOrientationLandscapeLeft];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = NO;
    [self supportRotion:UIInterfaceOrientationPortrait];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
