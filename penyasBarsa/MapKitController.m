//
//  MapKitController.m
//  penyasBarsa
//
//  Created by asgar on 04/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapKitController.h"
#import "MyLocation.h"

@implementation MapKitController

@synthesize mapKitView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    mapKitView.delegate = self;
    mapKitView.mapType = MKMapTypeStandard;
    
    for (id<MKAnnotation> annotation in mapKitView.annotations) {
        [mapKitView removeAnnotation:annotation];
    }
    
    //put pushPins for penyas
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"listaPenyas" ofType:@"plist"];
    NSArray *listaPenyas = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *penya in listaPenyas) {
        NSString *latitudeString = [penya objectForKey:@"latitude"];
        NSString *longitudeString = [penya objectForKey:@"longitude"];
        
        if (latitudeString != nil && latitudeString.length > 0 
            && longitudeString != nil && longitudeString.length > 0) {
            NSNumber *latitude = [NSNumber numberWithInt:[latitudeString intValue]];
            NSNumber *longitude = [NSNumber numberWithInt:[longitudeString intValue]];
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = latitude.doubleValue;
            coordinate.longitude = longitude.doubleValue;
            MyLocation *location = [[MyLocation alloc] initWithName:[penya objectForKey:@"nombre"] address:[penya objectForKey:@"direccion"] coordinate:coordinate];
            [mapKitView addAnnotation:location];
            
        }
        
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapKitView = nil;
}

- (void) viewWillAppear:(BOOL)animated{
    self.mapKitView.showsUserLocation = YES;
    [self mapView:self.mapKitView didUpdateUserLocation:mapKitView.userLocation];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}


@end
