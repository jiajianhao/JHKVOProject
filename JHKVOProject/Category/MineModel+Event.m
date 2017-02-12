//
//  MineModel+Event.m
//  JHKVOProject
//
//  Created by admin on 2017/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MineModel+Event.h"
@implementation MineModel (Event)
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
