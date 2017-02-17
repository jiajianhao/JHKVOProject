//
//  JHKVOProjectUITests.m
//  JHKVOProjectUITests
//
//  Created by admin on 2017/2/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface JHKVOProjectUITests : XCTestCase

@end

@implementation JHKVOProjectUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}
-(void)testUI{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *nextpageButton = app.buttons[@"NextPage"];
    [nextpageButton tap];
    
    XCUIElement *backButton = [[[app.navigationBars[@"AssociatedView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0];
    [backButton tap];
    
    XCUIElement *changetextButton = app.buttons[@"ChangeText"];
    [changetextButton tap];
    [nextpageButton tap];
    [backButton tap];
    [changetextButton tap];
    [changetextButton tap];
    [nextpageButton tap];
    [backButton tap];
    
}

-(void)testMineSteps{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *changetextButton = app.buttons[@"ChangeText"];
    [changetextButton tap];
    [changetextButton tap];
    
    XCUIElement *nextpageButton = app.buttons[@"NextPage"];
    [nextpageButton tap];
    
    XCUIElement *backButton = [[[app.navigationBars[@"AssociatedView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0];
    [backButton tap];
    [changetextButton tap];
    [nextpageButton tap];
    [backButton tap];
    [changetextButton tap];
    [changetextButton tap];
    
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
