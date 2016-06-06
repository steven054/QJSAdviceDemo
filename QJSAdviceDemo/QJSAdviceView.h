//
//  QJSAdviceView.h
//  QJSAdviceDemo
//
//  Created by 史德伟 on 16/5/12.
//  Copyright © 2016年 QJS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QJSAdviceView;

@protocol QJSAdviceViewDelegate <NSObject>
@optional
-(void)seleteAdview;
@end

@interface QJSAdviceView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *firstTable;
@property (nonatomic, assign) NSInteger memoryTime;
@property (nonatomic, retain) NSTimer *rooptimes;
@property (nonatomic, strong) NSMutableArray *tableArrays;
@property (nonatomic, weak)id <QJSAdviceViewDelegate> delegate;

@end
