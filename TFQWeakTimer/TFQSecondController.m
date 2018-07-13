//
//  TFQSecondController.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2018/7/13.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQSecondController.h"
#import "TFQWeakTimer.h"

@interface TFQSecondController ()

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, assign)int countDown;
@property (nonatomic, strong)TFQWeakTimer *weakTimer;

@end

@implementation TFQSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.countDown = 61;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 100, 40)];
    [self.view addSubview:self.label];
    
//    self.weakTimer = [[TFQWeakTimer alloc] initWithTarget:self andTimeInterval:1 andSelector:@selector(repeatAction:)];
    NSDictionary *dict = @{@"name" : @"zhangsna"};
    self.weakTimer = [[TFQWeakTimer alloc] initWithTimeInterval:1 target:self selector:@selector(repeatAction:) userInfo:nil];
}

- (void)repeatAction:(NSTimer *)timer{
    NSLog(@"%@",timer.userInfo);
    self.countDown --;
    self.label.text = [NSString stringWithFormat:@"倒计时%d秒",self.countDown];
}

- (void)dealloc{
    [self.weakTimer invalidateTimer];
    NSLog(@"secondController dealloc");
}

@end
