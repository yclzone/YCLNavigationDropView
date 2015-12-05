//
//  NavigationDropView.h
//  NavigationDropView
//
//  Created by YCLZONE on 12/5/15.
//  Copyright © 2015 YCLZONE. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectionDoneHandler)(NSInteger selectedIndex);

@interface NavigationDropView : UIView

/**  */
@property (nonatomic, strong) NSArray<NSString *> *items;

+ (instancetype)showFromView:(UIView *)view
                       items:(NSArray<NSString *> *)items
               initSelection:(NSInteger)selection
                 doneHandler:(SelectionDoneHandler)done;

@end
