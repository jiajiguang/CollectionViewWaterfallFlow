//
//  ZYActions.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYActions.h"


NSString *const kZYActionsUnixtime = @"unixtime";
NSString *const kZYActionsId = @"id";
NSString *const kZYActionsTitle = @"title";
NSString *const kZYActionsActionType = @"actionType";


@interface ZYActions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYActions

@synthesize unixtime = _unixtime;
@synthesize actionsIdentifier = _actionsIdentifier;
@synthesize title = _title;
@synthesize actionType = _actionType;


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
            self.unixtime = [[self objectOrNilForKey:kZYActionsUnixtime fromDictionary:dict] doubleValue];
            self.actionsIdentifier = [self objectOrNilForKey:kZYActionsId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZYActionsTitle fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kZYActionsActionType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unixtime] forKey:kZYActionsUnixtime];
    [mutableDict setValue:self.actionsIdentifier forKey:kZYActionsId];
    [mutableDict setValue:self.title forKey:kZYActionsTitle];
    [mutableDict setValue:self.actionType forKey:kZYActionsActionType];

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

    self.unixtime = [aDecoder decodeDoubleForKey:kZYActionsUnixtime];
    self.actionsIdentifier = [aDecoder decodeObjectForKey:kZYActionsId];
    self.title = [aDecoder decodeObjectForKey:kZYActionsTitle];
    self.actionType = [aDecoder decodeObjectForKey:kZYActionsActionType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unixtime forKey:kZYActionsUnixtime];
    [aCoder encodeObject:_actionsIdentifier forKey:kZYActionsId];
    [aCoder encodeObject:_title forKey:kZYActionsTitle];
    [aCoder encodeObject:_actionType forKey:kZYActionsActionType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYActions *copy = [[ZYActions alloc] init];
    
    if (copy) {

        copy.unixtime = self.unixtime;
        copy.actionsIdentifier = [self.actionsIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
    }
    
    return copy;
}


@end
