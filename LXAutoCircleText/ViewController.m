//
//  ViewController.m
//  LXAutoCircleText
//
//  Created by MacBook pro on 16/5/24.
//  Copyright © 2016年 FZ. All rights reserved.
//

#import "ViewController.h"
#import "LXAutoCircleText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    [LXAutoCircleText autoTimerCircleText:@"我很帅很帅很晒很晒henshenshai...要很长很长很长很长很长很长很长华南城很差很长很长才对嘛嘛嘛" TextFont:17 BackgroundColor:[UIColor redColor] InView:self.view Frame:CGRectMake(0, 0,300, 40)];
    
    
//    [LXAutoCircleText autoAnimationCircleText:@"我很帅很帅很晒很晒henshenshai...要很长很长很长很长很长很长很长华" TextFont:14 InView:self.view Frame:CGRectMake(0, 300,300, 40)];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
