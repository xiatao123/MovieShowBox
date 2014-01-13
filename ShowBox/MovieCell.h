//
//  MovieCell.h
//  ShowBox
//
//  Created by Tao Xia on 1/12/14.
//  Copyright (c) 2014 Tao Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieSummary;

@end
