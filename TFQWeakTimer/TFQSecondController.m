//
//  TFQSecondController.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2018/7/13.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQSecondController.h"
#import "TFQWeakTimer.h"
#import "TFQProxy/TFQProxy.h"
#import "TFQProxySubclass.h"
#import "TFQGCDTimer.h"

@interface TFQSecondController ()

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, assign)int countDown;
//方式一
@property (nonatomic, strong)TFQWeakTimer *weakTimer;
//方式二
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, copy)NSString *timerIdentifier;

@end

@implementation TFQSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.countDown = 61;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 100, 40)];
    [self.view addSubview:self.label];
    
    //self.weakTimer = [[TFQWeakTimer alloc] initWithTarget:self andTimeInterval:1 andSelector:@selector(repeatAction:)];
    //NSDictionary *dict = @{@"name" : @"zhangsna"};
    //方式一
    //self.weakTimer = [[TFQWeakTimer alloc] initWithTimeInterval:1 target:self selector:@selector(repeatAction:) userInfo:dict];
    //方式二   比方式三效率低一点
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[TFQProxy proxyWithTarget:self] selector:@selector(repeatAction:) userInfo:nil repeats:YES];
    //方式三
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[TFQProxySubclass proxyWithTarget:self] selector:@selector(repeatAction:) userInfo:nil repeats:YES];
    //方式四
    __weak typeof(self) weakSelf = self;
    self.timerIdentifier = [TFQGCDTimer schedleTask:^{
        [weakSelf repeatAction:nil];
    } interval:1 repeat:YES async:NO reuseIdentifier:@"identifier"];
}

- (void)repeatAction:(NSTimer *)timer{
    NSLog(@"%@",timer.userInfo);
    self.countDown --;
    self.label.text = [NSString stringWithFormat:@"倒计时%d秒",self.countDown];
}

- (void)dealloc{
    [self.weakTimer invalidateTimer];
    [self.timer invalidate];
    [TFQGCDTimer cancelTimer:self.timerIdentifier];
    NSLog(@"secondController dealloc");
}

@end
