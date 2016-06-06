//
//  QJSAdviceView.m
//  QJSAdviceDemo
//
//  Created by 史德伟 on 16/5/12.
//  Copyright © 2016年 QJS. All rights reserved.
//
#import "DFDevice.h"
#import "QJSAdviceView.h"
#import "QJSAdvicesModel.h"

#define kUIColorFromRGB(rgbValue)                                              \
  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0         \
                  green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0            \
                   blue:((float)(rgbValue & 0xFF)) / 255.0                     \
                  alpha:1.0]
#define QJSBlackColor32 kUIColorFromRGB(0x323232)
#define AdHeight 25

@implementation QJSAdviceView

- (instancetype)init {
  self = [super init];
  if (self) {
    self.tableArrays = [[NSMutableArray alloc] init];
    self.firstTable = [[UITableView alloc] init];
    self.firstTable.frame = CGRectMake(0,0,
                                       kScreenWidth, AdHeight);
    self.firstTable.delegate = self;
    self.firstTable.dataSource = self;
    self.firstTable.scrollEnabled = NO;
    self.firstTable.separatorStyle = UITableViewCellSeparatorStyleNone;
      self.firstTable.backgroundColor=[UIColor clearColor];
      self.firstTable.userInteractionEnabled=YES;
    [self addSubview:self.firstTable];

    self.rooptimes =
        [NSTimer scheduledTimerWithTimeInterval:2
                                         target:self
                                       selector:@selector(timerStop)
                                       userInfo:nil
                                        repeats:YES];
  }
  return self;
}

- (void)timerStop{
  if (self.memoryTime == self.tableArrays.count * 5) {
    self.memoryTime = 0;
    [self.firstTable setContentOffset:CGPointMake(0, AdHeight * self.memoryTime)
                             animated:YES];
    self.memoryTime++;
    return;
  }
  [self.firstTable setContentOffset:CGPointMake(0, AdHeight * self.memoryTime) animated:YES];
   self.memoryTime++;
}
#pragma mark - TableView datasource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.tableArrays.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *strId = @"ReuseRecommendCell";

  UITableViewCell *cell =
      (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:strId];
  UILabel *contentLable;
  UIImageView *leftImg;
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:strId];

    contentLable = [[UILabel alloc] init];
    contentLable.frame = CGRectMake(30, 0, kScreenWidth - 50, AdHeight);
    contentLable.font = [UIFont systemFontOfSize:12];
    contentLable.textColor = QJSBlackColor32;
      contentLable.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:contentLable];
    leftImg = [[UIImageView alloc] init];
    leftImg.frame = CGRectMake(10, 5, AdHeight - 10, AdHeight - 10);
    [cell.contentView addSubview:leftImg];
  }
  cell.selectionStyle = UITableViewCellSelectionStyleNone;

  QJSAdvicesModel *qjsAdModel = [self.tableArrays objectAtIndex:indexPath.row];
  contentLable.text = qjsAdModel.announce_title;
  leftImg.image = [UIImage imageNamed:@"advice_icon"];
  cell.contentView.backgroundColor=[UIColor clearColor];

  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [_delegate seleteAdview];

}
- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {

  return AdHeight;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
