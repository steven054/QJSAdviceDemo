//
//  ViewController.m
//  QJSAdviceDemo
//
//  Created by 史德伟 on 16/5/12.
//  Copyright © 2016年 QJS. All rights reserved.
//

#import "AFNetworking.h"
#import "DFDevice.h"
#import "MJExtension.h"
#import "QJSAdviceView.h"
#import "QJSAdvicesModel.h"
#import "QJSManagerAnnounceTool.h"
#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self requestData];
}

- (void)requestData {
  NSString *strUrl = @"https://devwww.qianjins.com/"
                     @"qjsapi.php?accessToken=&client=iphone&app_key=FW0KCZP6&"
                     @"v=1.2&r=site/"
                     @"announceIndex&secret_verify=1234&app_version=2.1.2&"
                     @"sign=CEB243894972CC5A5A9580FE393165CD";

  AFHTTPRequestOperationManager *managerAllPeopleSum =
      [AFHTTPRequestOperationManager manager];
  [managerAllPeopleSum GET:strUrl
      parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSMutableArray *tableArrays = [[NSMutableArray alloc] init];

        tableArrays = [QJSAdvicesModel
            objectArrayWithKeyValuesArray:[[responseObject objectForKey:@"data"]
                                              objectForKey:@"newNoticeList"]];

    [self.view addSubview:[QJSManagerAnnounceTool
                                  showAnnouncesWithViewController:self
                                                    andDataArrays:tableArrays]];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error){

      }];
}
- (void)seleteAdview {
  NSLog(@"点击了广告轮播");
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
