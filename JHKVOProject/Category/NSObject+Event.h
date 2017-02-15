//
//  NSObject+Event.h
//  MyRun
//
//  Created by jiajianhao on 2017/2/9.
//  Copyright © 2017年 jiajianhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Event)
@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *eventValue;

//
//- (NSArray *)ignoredNames;
//- (void)encode:(NSCoder *)aCoder;
//- (void)decode:(NSCoder *)aDecoder;

@end
