//
//  MovieCell.m
//  ShowBox
//
//  Created by Tao Xia on 1/12/14.
//  Copyright (c) 2014 Tao Xia. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"%@",reuseIdentifier);
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
