//
//  AppDelegate.h
//  ZLUikitTest
//
//  Created by zhulin on 2018/5/21.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

