//
//  ViewController.m
//  FullScreenDemo
//
//  Created by jefferson on 2018/6/22.
//  Copyright © 2018年 jefferson. All rights reserved.
//

#import "ViewController.h"

#define KmainWidth  [UIScreen mainScreen].bounds.size.width

#define KmainHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIButton  * nextButton;

@property (nonatomic, strong) UIButton  * fullScreenButton;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRotation = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI
{
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.fullScreenButton];
    WS(weakSelf);
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(50);
        make.right.equalTo(weakSelf.view).offset(-50);
        make.top.equalTo(weakSelf.view).offset(80);
        make.height.mas_offset(60);
    }];
    [self.fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(50);
        make.right.equalTo(weakSelf.view).offset(-50);
        make.top.equalTo(weakSelf.nextButton.mas_bottom).offset(50);
        make.height.mas_offset(60);
    }];
}

- (void)nextEvent
{
    NextViewController * next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:NO];
    
}

- (void)fullScreenEvent
{
    FullScreenViewController * full = [[FullScreenViewController alloc] init];
    [self.navigationController pushViewController:full animated:NO];

}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton new];
        [_nextButton setTitle:@"跳转下一个界面" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _nextButton.backgroundColor = [UIColor greenColor];
        [_nextButton addTarget:self action:@selector(nextEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (UIButton *)fullScreenButton
{
    if (!_fullScreenButton) {
        _fullScreenButton = [UIButton new];
        [_fullScreenButton setTitle:@"强制某一个界面横屏" forState:UIControlStateNormal];
        [_fullScreenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _fullScreenButton.backgroundColor = [UIColor purpleColor];
        [_fullScreenButton addTarget:self action:@selector(fullScreenEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fullScreenButton;
}

@end
