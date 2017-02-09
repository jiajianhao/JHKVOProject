//
//  AssociatedViewController.m
//  JHKVOProject
//
//  Created by admin on 2017/2/8.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AssociatedViewController.h"

@interface AssociatedViewController ()

@end

@implementation AssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    [self testTypeOf];
    
    
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
