//
//  ZYAction.h
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSArray *itemPicUrlList;
@property (nonatomic, strong) NSString *actionDescription;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *userPicUrl;
@property (nonatomic, strong) NSString *normalPicUrl;
@property (nonatomic, strong) NSString *dateTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
