//
//  BorderedView.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "BorderedView.h"
#import "ViewUtil.h"

@implementation BorderedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [ViewUtil addLineBorder:self];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
