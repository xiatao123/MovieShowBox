//
//  MovieViewController.m
//  ShowBox
//
//  Created by Tao Xia on 1/11/14.
//  Copyright (c) 2014 Tao Xia. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *moiveImage;
@property (weak, nonatomic) IBOutlet UILabel *description;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    NSData* imageData = [store objectForKey:@"image"];
    UIImage* image = [UIImage imageWithData:imageData];
    
    NSString *summary = [store objectForKey:@"summary"];
    self.moiveImage.image = image;
    self.description.text = summary;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
