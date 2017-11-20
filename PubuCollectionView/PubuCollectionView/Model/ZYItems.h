//
//  ZYItems.h
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZYComponent;

@interface ZYItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZYComponent *component;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
