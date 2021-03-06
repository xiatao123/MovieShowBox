//
//  MovieListViewController.m
//  ShowBox
//
//  Created by Tao Xia on 1/7/14.
//  Copyright (c) 2014 Tao Xia. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieCell.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSArray *movies;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.movies = [NSArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

            self.movies = [object valueForKey:@"movies"];
            
            NSLog(@"%@", object);
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"Moive List";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(!cell){
        cell = [[MovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSDictionary *movie =  [self.movies objectAtIndex:indexPath.row];
    //cell.textLabel.text = [movie objectForKey:@"title"];
    cell.movieTitle.text = [movie objectForKey:@"title"];
    cell.movieSummary.text = [movie objectForKey:@"synopsis"];
    NSURL * imageURL = [NSURL URLWithString:[[movie objectForKey: @"posters"] objectForKey:@"original"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];

    cell.movieImage.image = image;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = (MovieCell *)[tableView cellForRowAtIndexPath:indexPath];
    UIImage *image = cell.movieImage.image;
    NSString *summary = cell.movieSummary.text;
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    [store setObject:UIImagePNGRepresentation(image) forKey:@"image"];
    [store setObject:summary forKey:@"summary"];
    [store synchronize];
}

@end
