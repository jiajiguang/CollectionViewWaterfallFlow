//
//  ZYData.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYData.h"
#import "ZYItems.h"


NSString *const kZYDataFlag = @"flag";
NSString *const kZYDataLts = @"lts";
NSString *const kZYDataItems = @"items";
NSString *const kZYDataPin = @"pin";
NSString *const kZYDataAppApi = @"appApi";


@interface ZYData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYData

@synthesize flag = _flag;
@synthesize lts = _lts;
@synthesize items = _items;
@synthesize pin = _pin;
@synthesize appApi = _appApi;


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
            self.flag = [self objectOrNilForKey:kZYDataFlag fromDictionary:dict];
            self.lts = [self objectOrNilForKey:kZYDataLts fromDictionary:dict];
    NSObject *receivedZYItems = [dict objectForKey:kZYDataItems];
    NSMutableArray *parsedZYItems = [NSMutableArray array];
    if ([receivedZYItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYItems addObject:[ZYItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYItems isKindOfClass:[NSDictionary class]]) {
       [parsedZYItems addObject:[ZYItems modelObjectWithDictionary:(NSDictionary *)receivedZYItems]];
    }

    self.items = [NSArray arrayWithArray:parsedZYItems];
            self.pin = [self objectOrNilForKey:kZYDataPin fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kZYDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flag forKey:kZYDataFlag];
    [mutableDict setValue:self.lts forKey:kZYDataLts];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kZYDataItems];
    [mutableDict setValue:self.pin forKey:kZYDataPin];
    [mutableDict setValue:self.appApi forKey:kZYDataAppApi];

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

    self.flag = [aDecoder decodeObjectForKey:kZYDataFlag];
    self.lts = [aDecoder decodeObjectForKey:kZYDataLts];
    self.items = [aDecoder decodeObjectForKey:kZYDataItems];
    self.pin = [aDecoder decodeObjectForKey:kZYDataPin];
    self.appApi = [aDecoder decodeObjectForKey:kZYDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flag forKey:kZYDataFlag];
    [aCoder encodeObject:_lts forKey:kZYDataLts];
    [aCoder encodeObject:_items forKey:kZYDataItems];
    [aCoder encodeObject:_pin forKey:kZYDataPin];
    [aCoder encodeObject:_appApi forKey:kZYDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYData *copy = [[ZYData alloc] init];
    
    if (copy) {

        copy.flag = [self.flag copyWithZone:zone];
        copy.lts = [self.lts copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.pin = [self.pin copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
