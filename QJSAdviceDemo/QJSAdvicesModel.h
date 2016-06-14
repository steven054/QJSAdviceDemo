//
//  QJSAdvicesModel.h
//  QJSClient
//
//  Created by 史德伟 on 16/1/9.
//  Copyright (c) 2016年 Stefanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface QJSAdvicesModel : NSObject
@property(nonatomic,copy) NSString *announce_content;
@property(nonatomic,copy) NSString *announce_id;
@property(nonatomic,copy) NSString *announce_title;
@property(nonatomic,copy) NSString *create_time;
@property(nonatomic,copy) NSString *default_img;
@property(nonatomic,copy) NSString *detail_url;
@end
