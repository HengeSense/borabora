//
//  AppDelegate.m
//  OandB
//
//  Created by Marc Fiume on 2013-09-21.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "AppDelegate.h"
#import "Colors.h"
#import "ViewUtil.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBarTintColor:[Colors getPrimaryBackgroundColor]];
    
//    rgb(155, 89, 182)
    
    //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      nil]];
    
    
    UIFont* defaultLabelFont = [UIFont fontWithName:[ViewUtil getDefaultFontFamily] size:22];
    UIFont* defaultButtonFont = [UIFont fontWithName:[ViewUtil getDefaultFontFamily] size:22];
    
    [[UILabel appearance] setFont:defaultLabelFont];
    
    //[[UIButton appearance] setFont:defaultButtonFont];
    //[[UIButton appearance] setTitleColor:[Colors getPrimaryBackgroundColor] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16], NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTintColor:[Colors getPrimaryForegroundColor]];
    
    [[UIToolbar appearance] setBackgroundColor:[Colors getPrimaryBackgroundColor]];
    [[UIToolbar appearance] setTintColor:[Colors getToolbarButtonColor]];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[Colors getPrimaryBackgroundColor] Width:320 Height:49]];
    [[UITabBar appearance] setTintColor:[Colors getPrimaryForegroundColor]];
    [[UITabBar appearance] setSelectedImageTintColor:[Colors getPrimaryForegroundColor]];
    
    
    // Override point for customization after application launch.
    return YES;
}

- (UIImage *)imageWithColor:(UIColor *)color Width:(int)width Height:(int)height {
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
