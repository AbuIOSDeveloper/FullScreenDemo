//
//  NextViewController.m
//  FullScreenDemo
//
//  Created by jefferson on 2018/6/22.
//  Copyright © 2018年 jefferson. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"旋转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(clickBut:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    WS(weakSelf)
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(weakSelf.view).offset(-50);
        make.height.mas_offset(40);
        make.width.mas_offset(80);
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = YES;
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
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
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationLandscapeLeft;
}

- (void)clickBut:(UIButton *)sender
{
     sender.selected = !sender.isSelected;
    if (sender.selected) {
        [self supportRotion:UIInterfaceOrientationLandscapeLeft];
        
        
    } else {
        [self supportRotion:UIInterfaceOrientationPortrait];
    }
}



@end
