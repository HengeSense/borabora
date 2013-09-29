//
//  PrimaryUIButton.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "PrimaryUIButton.h"
#import "Colors.h"

@implementation PrimaryUIButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initUI];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void) initUI {
    [self setTitleColor:[Colors getPrimaryButtonColor] forState:UIControlStateNormal];
    UIFont* defaultButtonFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    [self setFont:defaultButtonFont];
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
