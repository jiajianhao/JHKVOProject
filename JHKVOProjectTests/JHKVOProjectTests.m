//
//  JHKVOProjectTests.m
//  JHKVOProjectTests
//
//  Created by admin on 2017/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface JHKVOProjectTests : XCTestCase
@property (nonatomic,strong) ViewController *vc;

@end

@implementation JHKVOProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //初始化的代码，在测试方法调用之前调用
    // 实例化需要测试的类
    self.vc = [[ViewController alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    self.vc = nil;

    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 测试用例的例子，注意测试用例一定要test开头

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    // 测试性能例子
//    __weak typeof (self) weakSelf =self;
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        // 需要测试性能的代码
//        [weakSelf testMyFuc];
        
        
        
        for (int i=0; i<100; i++) {
            NSLog(@"%d",i);
        }
    }];
}

- (void)testMyFuc {
 
    // 调用需要测试的方法，
    int result = [self.vc getNum];
    // 如果不相等则会提示@“测试不通过”
    XCTAssertEqual(result, 100,@"测试不通过");
}

-(void)testHHHHHHH{
//    // 调用需要测试的方法，
//    int result = [self.vc getNum];
//    // 如果不相等则会提示@“测试不通过”
//    XCTAssertEqual(result, 100,@"测试不通过");
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/1220559"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * data,NSURLResponse *reponse,NSError *error){
        //阻塞3秒
        [NSThread sleepForTimeInterval:3];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        
        XCTAssertNotNil(string,@"测试不通过");
    }];
    [task resume];

}
@end
