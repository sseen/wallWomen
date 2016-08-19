//
//  WebLIstModel.h
//  WallWomen
//
//  Created by sseen on 2016/8/19.
//  Copyright © 2016年 sseen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface WebListModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSInteger SubAdOn;

@property (nonatomic, copy  ) NSString  *source;

@property (nonatomic, copy  ) NSString  *abstract;

@property (nonatomic, copy  ) NSString  *origUrl;

@property (nonatomic, strong) NSArray<NSString  *> *thumbnails_qqnews;

@property (nonatomic, copy  ) NSString  *time;

@property (nonatomic, copy  ) NSString  *title;

@property (nonatomic, assign) NSInteger openAdsComment;

@property (nonatomic, strong) NSArray   *thumbnails_qqnews_for_pic;

@property (nonatomic, copy  ) NSString  *url;

@property (nonatomic, copy  ) NSString  *chlsicon;

@property (nonatomic, copy  ) NSString  *PlacementId;

@property (nonatomic, copy  ) NSString  *pubtime;

@property (nonatomic, copy  ) NSString  *chlname;

@property (nonatomic, copy  ) NSString  *chlmrk;

@property (nonatomic, copy  ) NSString  *chlicon;

@property (nonatomic, copy  ) NSString  *articletype;

@property (nonatomic, copy  ) NSString  *commentPlacementId;

@property (nonatomic, copy  ) NSString  *flag;

@property (nonatomic, strong) NSArray   *tag;

@property (nonatomic, copy  ) NSString  *sid;

@property (nonatomic, copy  ) NSString  *chlid;

@property (nonatomic, assign) NSInteger picShowType;

@property (nonatomic, assign) NSInteger timestamp;

@property (nonatomic, copy  ) NSString  *commentid;

@property (nonatomic, copy  ) NSString  *uin;

@property (nonatomic, assign) NSInteger show_expr;

@property (nonatomic, strong) NSArray<NSString  *> *thumbnails;

@property (nonatomic, strong) NSArray   *author;


@end
