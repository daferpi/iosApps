//
//  CustomCellMore.m
//  penyasBarsa
//
//  Created by asgar on 11/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCellMore.h"

@implementation CustomCellMore

@synthesize direccionLbl;
@synthesize poblacionLbl;
@synthesize provinciaLbl;
@synthesize paisLbl;
@synthesize telefonoLbl;
@synthesize webLbl;
@synthesize emailLbl;
@synthesize sociosLbl;
@synthesize facebookLbl;
@synthesize twitterLbl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
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
