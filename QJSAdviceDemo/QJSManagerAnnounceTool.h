//
//  QJSManagerAnnounceTool.h
//  QJSAdviceDemo
//
//  Created by 史德伟 on 16/5/13.
//  Copyright © 2016年 QJS. All rights reserved.
//

#import "QJSAdviceView.h"
#import "QJSAdvicesModel.h"
#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QJSManagerAnnounceTool : NSObject 
+ (QJSAdviceView *)showAnnouncesWithViewController:(ViewController *)views
                                     andDataArrays:(NSMutableArray *)dataArray;
@end
