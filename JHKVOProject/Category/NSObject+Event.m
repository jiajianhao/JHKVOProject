//
//  NSObject+Event.m
//  MyRun
//
//  Created by jiajianhao on 2017/2/9.
//  Copyright © 2017年 jiajianhao. All rights reserved.
//

#import "NSObject+Event.h"
#import <objc/runtime.h>
@implementation NSObject (Event)
char nameKey;

- (void)setName:(NSString *)name {
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self,_cmd);
}

///////////////////////////////////

-(void)setEventValue:(NSString *)eventValue{
    objc_setAssociatedObject(self, @selector(eventValue), eventValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)eventValue{
    return objc_getAssociatedObject(self, _cmd);
}



///////////////////////////////////
//
//- (void)decode:(NSCoder *)aDecoder {
//    // 一层层父类往上查找，对父类的属性执行归解档方法
//    Class c = self.class;
//    while (c &&c != [NSObject class]) {
//        
//        unsigned int outCount = 0;
//        Ivar *ivars = class_copyIvarList(c, &outCount);
//        for (int i = 0; i < outCount; i++) {
//            Ivar ivar = ivars[i];
//            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//            
//            // 如果有实现该方法再去调用
//            if ([self respondsToSelector:@selector(ignoredNames)]) {
//                if ([[self ignoredNames] containsObject:key]) continue;
//            }
//            
//            id value = [aDecoder decodeObjectForKey:key];
//            [self setValue:value forKey:key];
//        }
//        free(ivars);
//        c = [c superclass];
//    }
//    
//}
//
//- (void)encode:(NSCoder *)aCoder {
//    // 一层层父类往上查找，对父类的属性执行归解档方法
//    Class c = self.class;
//    while (c &&c != [NSObject class]) {
//        
//        unsigned int outCount = 0;
//        Ivar *ivars = class_copyIvarList([self class], &outCount);
//        for (int i = 0; i < outCount; i++) {
//            Ivar ivar = ivars[i];
//            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//            
//            // 如果有实现该方法再去调用
//            if ([self respondsToSelector:@selector(ignoredNames)]) {
//                if ([[self ignoredNames] containsObject:key]) continue;
//            }
//            
//            id value = [self valueForKeyPath:key];
//            [aCoder encodeObject:value forKey:key];
//        }
//        free(ivars);
//        c = [c superclass];
//    }
//}


@end
