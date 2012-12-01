//
//  DetailsController.m
//  penyasBarsa
//
//  Created by asgar on 21/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailsController.h"
#import "CustomCell.h"
#import "CustomCellMore.h"

@implementation DetailsController

@synthesize indexSelected = _indexSelected;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.indexSelected = 0;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // esto habra que pasarlo como parametro
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"listaPenyas" ofType:@"plist"];
    NSArray *listaPenyas = [NSArray arrayWithContentsOfFile:filePath];
    
    NSDictionary *penya = [listaPenyas objectAtIndex:self.indexSelected];

    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"CustomCell";
        CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        UIImage *image = [UIImage imageNamed:[penya objectForKey:@"escudo"]];
        cell.nombrePenya.font = [UIFont systemFontOfSize:12];
        cell.nombrePenya.text = [penya objectForKey:@"nombre"];
        cell.fundacion.text = [penya objectForKey:@"fundacion"];
        cell.escudo.image =image;
        return cell;
            
    } else {
        static NSString *CellIdentifier = @"customCellMore";
        CustomCellMore *cell = (CustomCellMore *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"customCellMore"owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.direccionLbl.text = [penya objectForKey:@"direccion"];
        cell.poblacionLbl.text = [penya objectForKey:@"poblacion"];
        cell.provinciaLbl.text = [penya objectForKey:@"provincia"];
        cell.paisLbl.text = [penya objectForKey:@"pais"];
        cell.telefonoLbl.text = [penya objectForKey:@"telefono"];
        cell.webLbl.text = [penya objectForKey:@"url"];
        cell.emailLbl.text = [penya objectForKey:@"email"];
        cell.sociosLbl.text = [penya objectForKey:@"numeroSocios"];
        
        UIImage *imageFacebook = [UIImage imageNamed:@"facebook_icon&24.png"];
        UIImage *imageTwitter = [UIImage imageNamed:@"twitter_icon&24.png"];
        
        cell.facebookLbl.image =imageFacebook;
        cell.twitterLbl.image =imageTwitter;
        
        
        return cell;
    }
       
    
   
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) { 
        return 99;
    } else {
        return 270;
    }
    
}

@end
