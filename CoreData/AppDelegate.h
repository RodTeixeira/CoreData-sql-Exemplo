//
//  AppDelegate.h
//  CoreData
//
//  Created by Rodolfo Teixeira on 22/02/17.
//  Copyright © 2017 Rodolfo Teixeira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

