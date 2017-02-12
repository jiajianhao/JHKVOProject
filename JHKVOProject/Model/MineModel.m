//
//  MineModel.m
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MineModel.h"
//#define Mine_message @"he is a pirate"
@implementation MineModel
-(void)doSomethingMethod:(NSString *)aaaa{
    NSLog(@"%@",aaaa);
}
-(void)setName:(NSString *)name{
    _name=name;
}
+(NSString*)myLowerCaseMessage{
    NSLog(@"%@",[Mine_message lowercaseString]);
    return [Mine_message lowercaseString];
}
+(NSString*)myUpperCaseMessage{
    NSLog(@"%@",[Mine_message uppercaseString]);
    return [Mine_message uppercaseString];
}
-(void)readText1{
    NSLog(@"readText1");
}
-(void)readText2{
    NSLog(@"readText2");

}
@end
