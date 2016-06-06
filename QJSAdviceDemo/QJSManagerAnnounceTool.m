//
//  QJSManagerAnnounceTool.m
//  QJSAdviceDemo
//
//  Created by 史德伟 on 16/5/13.
//  Copyright © 2016年 QJS. All rights reserved.
//

#import "DFDevice.h"
#import "QJSManagerAnnounceTool.h"

@implementation QJSManagerAnnounceTool

+ (QJSAdviceView *)showAnnouncesWithViewController:
                       (ViewController *)views
                                     andDataArrays:(NSMutableArray *)dataArray {
  QJSAdviceView *advies = [[QJSAdviceView alloc] init];
  advies.frame = CGRectMake(0, 50, kScreenWidth, 25);
  advies.delegate = views;
  [views.view addSubview:advies];
  advies.tableArrays = dataArray;
  return advies;
}

@end
