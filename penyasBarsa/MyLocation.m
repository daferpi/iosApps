//
//  MyLocation.m
//  penyasBarsa
//
//  Created by asgar on 06/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyLocation.h"


@implementation MyLocation

@synthesize name = _name;
@synthesize address = _adrress;
@synthesize coordinate = _coordinate;

- (id) initWithName:(NSString *)name address:(NSString *)address coordinate:(CLLocationCoordinate2D)coordinate{
    if (self = [super init]) {
        _name = [name copy];
        _adrress = [address copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    if ([_name isKindOfClass:[NSNull class]]) {
        return @"Unknow name";
    }else{
        return _name;
    }
}

- (NSString *)subtitle {
    return _adrress;
}
    

@end
