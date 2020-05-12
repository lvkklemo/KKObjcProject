//
//  AutomicVC.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/6.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "AutomicVC.h"
#import "TimerController.h"
#import "GCDTimer.h"

/// 验证码时间
NSUInteger const OKMaxWords = 10;

@interface AutomicVC ()
@property(nonatomic,copy) NSString * name;
@property(nonatomic,weak) UIButton * button;
/// 计时Count
@property (nonatomic, readwrite, assign) NSUInteger count;
@end

@implementation AutomicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"定时器";
    [self setUpUI];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //TimerController * vc = [[TimerController alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
}

- (void)setUpUI{
    
  UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 160, 120, 30)];
  button.backgroundColor=[UIColor groupTableViewBackgroundColor];
  [self.view addSubview:button];
  [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
   self.button = button;
   self.count = OKMaxWords;
    [button setTitle:[NSString stringWithFormat:@"%zd",OKMaxWords] forState:UIControlStateNormal];
    
}

- (void)buttonAction{
    self.button.enabled = NO;
    if (self.count==OKMaxWords) {
       self.name = [GCDTimer execTask:self selector:@selector(_timerValueChanged) start:1 interval:1 repeats:YES async:NO];
    }else{
        
    }
    
    
}

- (void)_timerValueChanged{
    NSLog(@"%s",__func__);
    self.count--;
     [self.button setTitle:[NSString stringWithFormat:@"%zd",self.count] forState:UIControlStateNormal];
    if (self.count == -1) {
        self.count = OKMaxWords;
        self.button.enabled=YES;
        [self.button setTitle:[NSString stringWithFormat:@"%zd",OKMaxWords] forState:UIControlStateNormal];
        [GCDTimer cancelTask:self.name];
    }
    
}

@end

/*
 nonatomic和atomic
 atomic原子性,get,set方法加锁
 给属性加上atomic,可以保证getter,setter方法都是原子性操作,也就是说保证getter,setter线程同步的
 */
