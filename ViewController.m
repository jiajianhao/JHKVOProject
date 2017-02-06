//
//  ViewController.m
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
// 根据这篇文章 http://www.cocoachina.com/ios/20150313/11321.html 写的

#import "ViewController.h"
#import "MineModel.h"
#import "NSObject+JHKVO.h"
#import <objc/runtime.h>
#import<objc/message.h>
@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITextField *textfield;
@property (nonatomic, weak) IBOutlet UIButton *button;

@property (nonatomic, strong) MineModel *mModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mModel =[[MineModel alloc]init];
    [self.mModel JH_addObserver:self forKey:NSStringFromSelector(@selector(text)) withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue){
        
        NSLog(@"%@.%@ is now: %@", observedObject, observedKey, newValue);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textfield.text = newValue;
        });
    }];
    
    //send message to 'eat' method in Person Class or Person Instance
 //发送消息给Person类或者Person实例的‘eat’方法 不含参数
    [self.mModel performSelector:@selector(eat) withObject:nil];
 //发送消息给Person类的‘eat’方法 含两个参数
     [self.mModel performSelector:@selector(eat:with:)
                                          withObject:@"Hello"
                                         ];
    
//    [self changeMessage:nil];
    [self myJudge];
}

-(void)myJudge{
 Class clazz = [[NSClassFromString(@"MineModel") alloc] init];
    NSLog(@"%@",clazz);
    //获取替换前的类方法
          Method instance_eat =
              class_getClassMethod(clazz, @selector(resolveInstanceMethod:));
          //获取替换后的类方法
          Method instance_notEat =
              class_getClassMethod(self, @selector(hy_resolveInstanceMethod:));
 SEL sel = NSSelectorFromString(@"doSomethingMethod:");//注意这个冒号,说明方法带有参数
    
 if([self.mModel respondsToSelector:sel]) {
     [self.mModel performSelector:sel withObject:@"12345678"]; //注意如果有两个参数,使用两个withObject:参数;
  }
}

- (IBAction)changeMessage:(id)sender
{
    NSArray *msgs = @[@"谦卑", @"荣誉", @"牺牲", @"英勇",@"怜悯",@"诚实",@"公正",@"虔灵"];
    NSUInteger index = arc4random_uniform((u_int32_t)msgs.count);
    self.mModel.text = msgs[index];
}
void eat_1(id self,SEL sel)
  {
          NSLog(@"到底吃不吃饭了");
          NSLog(@"%@ %@",self,NSStringFromSelector(sel));
      }
void eat_2(id self,SEL sel, NSString* str1)
  {
          NSLog(@"到底吃不吃饭了");
          NSLog(@"%@ %@",self,NSStringFromSelector(sel));
          NSLog(@"打印两个参数值：%@ ",str1);
      }



+(BOOL)hy_resolveInstanceMethod:(SEL)sel{
          //当sel为实现方法中 有 eat 方法
          if (sel == NSSelectorFromString(@"eat")) {
                  //就 动态添加eat方法
                   // 第一个参数：给哪个类添加方法
                  // 第二个参数：添加方法的方法编号
                  // 第三个参数：添加方法的函数实现（函数地址）
                  // 第四个参数：函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
                  class_addMethod(self, sel, (IMP)eat_1, "v@:");
              }
          return YES;
      }

+(BOOL)hy2_resolveClassMethod:(SEL)sel{
    
          if (sel == NSSelectorFromString(@"eat:with:")) {
         
                  class_addMethod(objc_getMetaClass("Person"), sel, (IMP)eat_2, "v#:@@");
              }
    
          return YES;
      }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
