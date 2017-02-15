//
//  MineModel+Event.m
//  JHKVOProject
//
//  Created by admin on 2017/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MineModel+Event.h"
@implementation MineModel (Event)
//+(void)load{
//    Method m1 = class_getClassMethod([self class], @selector(jh_name));
//    Method m2 = class_getClassMethod([self class], @selector(jh_name_alias));
//    method_exchangeImplementations(m1, m2);
//    
//}

 /////////////////////////////////

-(void)setJh_name:(NSString *)jh_name{
    objc_setAssociatedObject(self, @selector(jh_name), jh_name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)jh_name{
    return  objc_getAssociatedObject(self, _cmd);
}
/////////////////////////////////
-(void)setJh_name_alias:(NSString *)jh_name_alias{
    objc_setAssociatedObject(self, @selector(jh_name_alias), jh_name_alias, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(NSString *)jh_name_alias{
    return  objc_getAssociatedObject(self, _cmd);
}
/////////////////////////////////


@end
