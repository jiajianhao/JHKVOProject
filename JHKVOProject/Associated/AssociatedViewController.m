//
//  AssociatedViewController.m
//  JHKVOProject
//
//  Created by admin on 2017/2/8.
//  Copyright © 2017年 admin. All rights reserved.
//
//根据http://ios.jobbole.com/84919/写的

#import "AssociatedViewController.h"
#import "MineModel.h"
#import <objc/NSObjCRuntime.h>
#import <Foundation/NSObjCRuntime.h>
typedef NS_ENUM(NSInteger, Test1) {
    
    //以下是枚举成员
    
    TestA = 0,
    
    TestB = 1,
    
    TestC = 2,
    
    TestD = 3
    
};

@interface AssociatedViewController ()

@end

@implementation AssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    [self testTypeOf];
    [self mineClassMethodChange];
    [self mineInstanceMethodChange];
    [self mineSetProperty];
    [self readObjectPerporties];
    NSLog(@"%ld %ld %ld %ld",(long)TestA,(long)TestB,(long)TestC,(long)TestD);
    
   
    [self getBlock:^(NSDictionary*json){
        NSLog(@"%@",json);
    }andPostData:@"https://api.douban.com/v2/book/1220560"];
    
    
    
}

#pragma mark 类方法交换
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
#pragma mark 实例方法交换
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
#pragma mark 分类中设置属性
-(void)mineSetProperty{
    MineModel *model1 =[[MineModel alloc]init];
    model1.jh_name=@"jiajianhao";
    model1.jh_name=@"jiahao";
    NSLog(@"%@",model1.jh_name);
    NSLog(@"%@",model1.jh_name);
    
}


#pragma mark 读取object所有属性
-(void)readObjectPerporties{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([MineModel class], &outCount);
    
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivars);
}





#pragma mark typeof
-(void)testTypeOf{
    NSString *str;
    __strong typeof(str) a = @"2";
    BOOL isClass = [a isKindOfClass:[NSString class]];
    if (isClass == YES) {
        NSLog(@"yes");
    }
}
////////////////////////////////

-(void)readMyBook{
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/1220559"];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * data,NSURLResponse *reponse,NSError *error){
        NSError *jhError;
        //          NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"string:%@",string);
        NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jhError];
        NSLog(@"result:%@",result);
        
        NSLog(@"error:%@",error);
        
        NSLog(@"jhError:%@",jhError);
        
        
    }];
    [task resume];
}
////////////////////////////////

- (void)getBlock:(void (^)(NSDictionary* json))susscess andPostData:(NSString*)data{
    NSURL *url = [NSURL URLWithString:data];
//    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/1220560"];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0];
    
    NSURLSessionDataTask *task =[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        NSError *error1;
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
        NSLog(@"%@",dic);
        
        susscess(dic);
        
//        return dic;
    }];
    
    [task resume];
    
}


////////////////////////////////


////////////////////////////////

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
