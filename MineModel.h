//
//  MineModel.h
//  JHKVOProject
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *text;
-(void)doSomethingMethod:(NSString*)aaaa;
-(NSString*)myMessage1;
-(NSString*)myMessage2;
@end
