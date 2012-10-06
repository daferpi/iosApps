//
//  MyLocation.h
//  penyasBarsa
//
//  Created by asgar on 06/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>{
    NSString *_name;
    NSString *_adrress;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id) initWithName:(NSString *)name address:(NSString *)address coordinate:(CLLocationCoordinate2D)coordinate;

@end
