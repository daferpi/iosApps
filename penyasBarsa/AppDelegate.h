//
//  AppDelegate.h
//  penyasBarsa
//
//  Created by asgar on 27/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class MapKitController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITabBarController *viewController;
    UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;



@end
