//
//  ViewController.m
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
// 根据这篇文章 http://www.cocoachina.com/ios/20150313/11321.html 写的

#import "ViewController.h"
#import "MineModel.h"
#import "AssociatedViewController.h"
@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITextField *textfield;
@property (nonatomic, weak) IBOutlet UIButton *button;


@property (nonatomic, strong) MineModel *mModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //*************************
    self.mModel =[[MineModel alloc]init];
    
    [self.mModel JH_addObserver:self forKey:@"name" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue){
        
        NSLog(@"%@.%@ old is %@ new is: %@", observedObject, observedKey,oldValue, newValue);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textfield.text = newValue;
         });
    }];
   
    //*************************
    SEL sel=@selector(test::);
    NSString *functionName= NSStringFromSelector(sel);
    NSLog(@"functionName: %@",functionName);
    [self performSelector:sel withObject:@"1234" afterDelay:0];
    
    //*************************
    [self myMethodSwizzling];
    //*************************
    
    
    
}

- (IBAction)changeMessage:(id)sender
{
    NSArray *msgs = @[@"谦卑", @"荣誉", @"牺牲", @"英勇",@"怜悯",@"诚实",@"公正",@"虔灵"];
    NSUInteger index = arc4random_uniform((u_int32_t)msgs.count);
//    self.mModel.text = msgs[index];
    self.mModel.name=msgs[index];

}
- (IBAction)Nestpage:(id)sender
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(gotoNextPage) object:sender];
    [self performSelector:@selector(gotoNextPage) withObject:sender afterDelay:0.2f];
}
-(void)gotoNextPage{
    AssociatedViewController *aView =[[AssociatedViewController alloc]init];
    [self.navigationController pushViewController:aView animated:YES];
    

}

-(void)test :(NSString *)str1  :(NSString*)str2{
    NSLog(@"class ===>%@",[MineModel class]);
    Class myClazz = NSClassFromString(@"MineModel");
    NSLog(@"class ===>%@",[myClazz class]);
    NSLog(@"%@%@", str1,str2);
    
}
#pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(void)myJudge{
    
    SEL sel = NSSelectorFromString(@"doSomethingMethod:");//注意这个冒号,说明方法带有参数
    
    if([self.mModel respondsToSelector:sel]) {
          [self.mModel performSelector:sel withObject:@"12345678"]; //注意如果有两个参数,使用两个withObject:参数;
    }
}



-(void)myMethodSwizzling{
    Method originalMethod = class_getInstanceMethod([self class], @selector(myMessage1));
    Method swapMethod = class_getInstanceMethod([self class], @selector(myMessage2));
    method_exchangeImplementations(originalMethod, swapMethod);
    NSLog(@"my message1 =%@", [self myMessage1]);
    
}
-(NSString*)myMessage1{
    return @"he is a pirate \n myMessage1";
}
-(NSString*)myMessage2{
    
    return [@"he is a pirate \n myMessage2" uppercaseString];
}

- (int)getNum {
    
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
