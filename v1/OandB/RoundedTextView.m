//
//  RoundedTextView.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "RoundedTextView.h"
#import "ViewUtil.h"

@implementation RoundedTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initHelper];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initHelper];
    }
    return self;
}

-(void) initHelper {
    float pad = 20.0f;
    CGRect r = CGRectMake(pad, 0, self.frame.size.width-2*pad, self.frame.size.height);
    label = [[UILabel alloc] initWithFrame:r];
    
    [ViewUtil roundView:self];
    [ViewUtil addLineBorder:self];
}

-(void) setText:(NSString*)s {
    [label setText:s];
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
