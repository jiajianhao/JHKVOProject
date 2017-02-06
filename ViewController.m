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
    [self changeMessage:nil];
}

- (IBAction)changeMessage:(id)sender
{
    NSArray *msgs = @[@"谦卑", @"荣誉", @"牺牲", @"英勇",@"怜悯",@"诚实",@"公正",@"虔灵"];
    NSUInteger index = arc4random_uniform((u_int32_t)msgs.count);
    self.mModel.text = msgs[index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
