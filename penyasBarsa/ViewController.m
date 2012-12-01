//
//  ViewController.m
//  penyasBarsa
//
//  Created by asgar on 27/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DetailsController.h"

@implementation ViewController


@synthesize listaPenyas;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) loadPenyas{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"listaPenyas" ofType:@"plist"];
    self.listaPenyas = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%d", [self.listaPenyas count]);
    [self.tableView reloadData];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];

	// Do any additional setup after loading the view, typically from a nib.
    [self loadPenyas];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.listaPenyas = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listaPenyas count];
}

//reescalado de imagenes
- (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *penya = [self.listaPenyas objectAtIndex:indexPath.row];
    
    UIImage *image = [UIImage imageNamed:[penya objectForKey:@"escudo"]];
    
    UIImage *scaledImage = [self scale:image toSize:CGSizeMake(60, 60)];
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.text = [penya objectForKey:@"nombre"];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    cell.detailTextLabel.text = [penya objectForKey:@"zona"];
    
    cell.imageView.image =scaledImage;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailsController *detailViewController = [[DetailsController alloc] initWithNibName:@"DetailsController" bundle:nil];
    detailViewController.indexSelected = indexPath.row;
    
    
     // Pass the selected object to the new view controller.
    [[self navigationController] pushViewController:detailViewController animated:YES];
    //[self presentModalViewController:detailViewController animated:YES];
}

@end
