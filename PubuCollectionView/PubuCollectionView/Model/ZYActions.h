//
//  ZYActions.h
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYActions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unixtime;
@property (nonatomic, strong) NSString *actionsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *actionType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
