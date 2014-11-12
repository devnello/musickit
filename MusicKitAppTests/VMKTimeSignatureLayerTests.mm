//  Copyright (c) 2014 Venture Media Labs. All rights reserved.

#import "VMKAdHocScoreTestCase.h"
#import "VMKImageStore.h"
#import "VMKTimeSignatureLayer.h"


@interface VMKTimeSignatureLayerTests : VMKAdHocScoreTestCase

@end

@implementation VMKTimeSignatureLayerTests

- (void)testCommonTime {
    mxml::dom::Time time;
    time.setSymbol(mxml::dom::Time::SYMBOL_COMMON);
    
    mxml::TimeSignatureGeometry geom(time);
    VMKTimeSignatureLayer* layer = [[VMKTimeSignatureLayer alloc] initWithTimeSignatureGeometry:&geom];
    
    CGSize size = layer.preferredFrameSize;
    XCTAssertTrue(size.width > 0, @"Width should be greater than zero");
    XCTAssertTrue(size.height > 0, @"Height should be greater than zero");

    [self testLayer:layer forSelector:_cmd withAccuracy:VIEW_RENDER_ACCURACY];
}

- (void)testVerticalDigits {
    mxml::dom::Time time;
    time.setBeats(3);
    time.setBeatType(16);
    
    mxml::TimeSignatureGeometry geom(time);
    VMKTimeSignatureLayer* layer = [[VMKTimeSignatureLayer alloc] initWithTimeSignatureGeometry:&geom];
    
    CGSize size = layer.preferredFrameSize;
    XCTAssertTrue(size.width > 0, @"Width should be greater than zero");
    XCTAssertTrue(size.height > 0, @"Height should be greater than zero");

    [self testLayer:layer forSelector:_cmd withAccuracy:VIEW_RENDER_ACCURACY];
}

@end