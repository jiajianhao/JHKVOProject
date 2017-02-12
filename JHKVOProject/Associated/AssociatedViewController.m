//
//  AssociatedViewController.m
//  JHKVOProject
//
//  Created by admin on 2017/2/8.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AssociatedViewController.h"
#import <objc/runtime.h>
#import "MineModel.h"
@interface AssociatedViewController ()

@end

@implementation AssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    [self testTypeOf];
    [self mineClassMethodChange];
    [self mineInstanceMethodChange];

    
}
-(void)mineClassMethodChange{
    //类方法
    Method m1 = class_getClassMethod([MineModel class], @selector(myLowerCaseMessage));
    Method m2 = class_getClassMethod([MineModel class], @selector(myUpperCaseMessage));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
    // 交换后，先打印学习，再打印跑！
      [MineModel myLowerCaseMessage];
      [MineModel myUpperCaseMessage];
 }
-(void)mineInstanceMethodChange{
    MineModel *model1 =[[MineModel alloc]init];
    
    Method m1 = class_getInstanceMethod([model1 class], @selector(readText1));
    Method m2 = class_getInstanceMethod([model1 class], @selector(readText2));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
    // 交换后，先打印学习，再打印跑！
    [model1 readText1];
    [model1 readText2];
}
-(void)testTypeOf{
    NSString *str;
    __strong typeof(str) a = @"2";
    BOOL isClass = [a isKindOfClass:[NSString class]];
    if (isClass == YES) {
        NSLog(@"yes");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
