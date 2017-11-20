//
//  ZYItems.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYItems.h"
#import "ZYComponent.h"


NSString *const kZYItemsComponent = @"component";
NSString *const kZYItemsTimestamp = @"timestamp";
NSString *const kZYItemsWidth = @"width";
NSString *const kZYItemsHeight = @"height";


@interface ZYItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYItems

@synthesize component = _component;
@synthesize timestamp = _timestamp;
@synthesize width = _width;
@synthesize height = _height;


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
            self.component = [ZYComponent modelObjectWithDictionary:[dict objectForKey:kZYItemsComponent]];
            self.timestamp = [self objectOrNilForKey:kZYItemsTimestamp fromDictionary:dict];
            self.width = [self objectOrNilForKey:kZYItemsWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kZYItemsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kZYItemsComponent];
    [mutableDict setValue:self.timestamp forKey:kZYItemsTimestamp];
    [mutableDict setValue:self.width forKey:kZYItemsWidth];
    [mutableDict setValue:self.height forKey:kZYItemsHeight];

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

    self.component = [aDecoder decodeObjectForKey:kZYItemsComponent];
    self.timestamp = [aDecoder decodeObjectForKey:kZYItemsTimestamp];
    self.width = [aDecoder decodeObjectForKey:kZYItemsWidth];
    self.height = [aDecoder decodeObjectForKey:kZYItemsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_component forKey:kZYItemsComponent];
    [aCoder encodeObject:_timestamp forKey:kZYItemsTimestamp];
    [aCoder encodeObject:_width forKey:kZYItemsWidth];
    [aCoder encodeObject:_height forKey:kZYItemsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYItems *copy = [[ZYItems alloc] init];
    
    if (copy) {

        copy.component = [self.component copyWithZone:zone];
        copy.timestamp = [self.timestamp copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
