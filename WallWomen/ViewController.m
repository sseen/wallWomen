//
//  ViewController.m
//  WallWomen
//
//  Created by sseen on 2016/8/2.
//  Copyright © 2016年 sseen. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>
#import <YYModel/YYModel.h>
#import "TFHpple.h"
#import "WebListModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *strURL = @"http://kuaibao.qq.com/s/MEDIANEWSLIST?chlid=5176296";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:strURL parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        TFHpple *doc = [[TFHpple alloc] initWithXMLData:(NSData *)responseObject];
//        NSArray *contentArray = [doc searchWithXPathQuery:@"//body//script"];
//        TFHppleElement *element = contentArray[0];
        
        NSString *fetchedXML = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        // NSLog(@"Response string: %@",fetchedXML);
        NSRange startRange = [fetchedXML rangeOfString:@"var mediaList ="];
        NSRange endRange   = [fetchedXML rangeOfString:@"}];" options:NSCaseInsensitiveSearch range:NSMakeRange(startRange.location, fetchedXML.length - startRange.location)];
        
        NSString *jsonStr  = [fetchedXML substringWithRange:NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length + 2)];
        NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        WebListModel *user = [MTLJSONAdapter modelsOfClass:WebListModel.class fromJSONArray:json error:nil];
        
        NSLog(@"%@", user);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"visit error: %@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
