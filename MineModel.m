//
//  MineModel.m
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MineModel.h"

@implementation MineModel
-(void)doSomethingMethod:(NSString *)aaaa{
    NSLog(@"%@",aaaa);
}
-(void)setName:(NSString *)name{
    _name=name;
}
-(NSString*)myMessage1{
    return @"he is a pirate \n myMessage1";
}
-(NSString*)myMessage2{
    return [@"he is a pirate \n myMessage2" uppercaseString];
}
@end
