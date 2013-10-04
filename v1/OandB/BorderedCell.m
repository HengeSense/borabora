//
//  BorderedCell.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "BorderedCell.h"
#import "ViewUtil.h"

@implementation BorderedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [ViewUtil addLineBorder:self];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
