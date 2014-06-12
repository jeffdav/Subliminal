//
//  SLCollectionViewTest.m
//  Subliminal
//
//  Created by Jeffrey Davis on 6/12/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface SLCollectionViewTest : SLIntegrationTest

@end

@implementation SLCollectionViewTest

+ (NSString *)testCaseViewControllerClassName {
    return @"SLCollectionViewTestViewController";
}

- (void)testSLHeaderButton {
    SLButton *button = [SLButton elementWithAccessibilityLabel:@"Header Button"];
    [button tap];
}

- (void)testSLCellButton {
    SLButton *button = [SLButton elementWithAccessibilityLabel:@"Cell Button 1"];
    [button tap];
}

@end
