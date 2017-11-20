//
//  ZYItemPicUrlList.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYItemPicUrlList.h"


NSString *const kZYItemPicUrlListPicUrl = @"picUrl";
NSString *const kZYItemPicUrlListPart = @"part";


@interface ZYItemPicUrlList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYItemPicUrlList

@synthesize picUrl = _picUrl;
@synthesize part = _part;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.picUrl = [self objectOrNilForKey:kZYItemPicUrlListPicUrl fromDictionary:dict];
            self.part = [self objectOrNilForKey:kZYItemPicUrlListPart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kZYItemPicUrlListPicUrl];
    [mutableDict setValue:self.part forKey:kZYItemPicUrlListPart];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.picUrl = [aDecoder decodeObjectForKey:kZYItemPicUrlListPicUrl];
    self.part = [aDecoder decodeObjectForKey:kZYItemPicUrlListPart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kZYItemPicUrlListPicUrl];
    [aCoder encodeObject:_part forKey:kZYItemPicUrlListPart];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYItemPicUrlList *copy = [[ZYItemPicUrlList alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.part = [self.part copyWithZone:zone];
    }
    
    return copy;
}


@end
