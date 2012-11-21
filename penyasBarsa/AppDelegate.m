//
//  AppDelegate.m
//  penyasBarsa
//
//  Created by asgar on 27/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MapKitController.h"
#import "TabBarController.h"



@implementation AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    //splash screen time
    sleep(2);
    
    //customize components
    UIImage *tabbarImage = [[UIImage imageNamed:@"bottomTabbar"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UITabBar appearance] setBackgroundImage:tabbarImage];
    
    UIImage *navigationImage = [[UIImage imageNamed:@"tittlebar"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UINavigationBar appearance ] setBackgroundImage:navigationImage forBarMetrics:UIBarMetricsDefault];
    
    // Override point for customization after application launch.
    
    viewController = [[TabBarController alloc] initWithNibName:@"TabBarController" bundle:nil];
       
    ViewController *tableView =  [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    MapKitController *mapKitView =  [[MapKitController alloc] initWithNibName:@"MapKitController" bundle:nil];
    
    navigationController = [[UINavigationController alloc]initWithRootViewController:tableView];
    
    navigationController.title = @"";
    
    tableView.tabBarItem.image = [UIImage imageNamed:@"text-list.png"];
    

    mapKitView.tabBarItem.image = [UIImage imageNamed:@"map-pin.png"];
    
    NSArray *viewList = [NSArray arrayWithObjects:navigationController, mapKitView, nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [viewController setViewControllers:viewList];

    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //splash screen time
    sleep(2);
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
