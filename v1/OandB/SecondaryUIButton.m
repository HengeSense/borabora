//
//  SecondaryUIButton.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "SecondaryUIButton.h"
#import "Colors.h"

@implementation SecondaryUIButton

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
    [self setTitleColor:[Colors getSecondaryButtonColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithWhite:0.8f alpha:1.0f] forState:UIControlStateDisabled];
    [self setTitleColor:[Colors getColorWithTranslucency:0.6f FromColor:[Colors getSecondaryButtonColor]] forState:UIControlStateHighlighted];
    
    
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
