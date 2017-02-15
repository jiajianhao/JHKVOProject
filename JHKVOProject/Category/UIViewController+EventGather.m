//
//  UIViewController+EventGather.m
//  JHKVOProject
//
//  Created by admin on 2017/2/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIViewController+EventGather.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation UIViewController (EventGather)
-(void)viewDidLoad {
//    NSLog(@"页面load:%@", self);
}
-(void)viewWillAppear:(BOOL)animated{
//    NSLog(@"页面出现:%@", self);
}
-(void)viewWillDisappear:(BOOL)animated{
//    NSLog(@"页面消失:%@", self);
}

#pragma clang diagnostic pop



//////////////////////////////////////////////////
-(void)setJh_RootPage:(NSString *)jh_RootPage{
    objc_setAssociatedObject(self, @selector(jh_RootPage), jh_RootPage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)jh_RootPage{
    return  objc_getAssociatedObject(self, _cmd);
}
//////////////////////////////////////////////////

-(void)setJh_PreviousPage:(NSString *)jh_PreviousPage{
    objc_setAssociatedObject(self, @selector(jh_PreviousPage), jh_PreviousPage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)jh_PreviousPage{
    return  objc_getAssociatedObject(self, _cmd);
}
//////////////////////////////////////////////////
@end
