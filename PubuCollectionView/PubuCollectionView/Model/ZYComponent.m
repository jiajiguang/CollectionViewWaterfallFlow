//
//  ZYComponent.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYComponent.h"
#import "ZYAction.h"
#import "ZYActions.h"


NSString *const kZYComponentMonthColor = @"monthColor";
NSString *const kZYComponentShowId = @"showId";
NSString *const kZYComponentWeekDayBgUrl = @"weekDayBgUrl";
NSString *const kZYComponentPicUrl = @"picUrl";
NSString *const kZYComponentShowTimeColor = @"showTimeColor";
NSString *const kZYComponentMonth = @"month";
NSString *const kZYComponentXingQi = @"xingQi";
NSString *const kZYComponentBackgroundUrl = @"backgroundUrl";
NSString *const kZYComponentShowTypeId = @"showTypeId";
NSString *const kZYComponentWeekDay = @"weekDay";
NSString *const kZYComponentComponentType = @"componentType";
NSString *const kZYComponentMonthOnly = @"monthOnly";
NSString *const kZYComponentDay = @"day";
NSString *const kZYComponentAction = @"action";
NSString *const kZYComponentYear = @"year";
NSString *const kZYComponentHasVideo = @"hasVideo";
NSString *const kZYComponentId = @"id";
NSString *const kZYComponentPublishColor = @"publishColor";
NSString *const kZYComponentShowTime = @"showTime";
NSString *const kZYComponentTrackValue = @"trackValue";
NSString *const kZYComponentItemsCount = @"itemsCount";
NSString *const kZYComponentWeekDayColor = @"weekDayColor";
NSString *const kZYComponentCollectionCount = @"collectionCount";
NSString *const kZYComponentCommentCount = @"commentCount";
NSString *const kZYComponentActions = @"actions";
NSString *const kZYComponentDayColor = @"dayColor";
NSString *const kZYComponentShowType = @"showType";
NSString *const kZYComponentDescription = @"description";


@interface ZYComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYComponent

@synthesize monthColor = _monthColor;
@synthesize showId = _showId;
@synthesize weekDayBgUrl = _weekDayBgUrl;
@synthesize picUrl = _picUrl;
@synthesize showTimeColor = _showTimeColor;
@synthesize month = _month;
@synthesize xingQi = _xingQi;
@synthesize backgroundUrl = _backgroundUrl;
@synthesize showTypeId = _showTypeId;
@synthesize weekDay = _weekDay;
@synthesize componentType = _componentType;
@synthesize monthOnly = _monthOnly;
@synthesize day = _day;
@synthesize action = _action;
@synthesize year = _year;
@synthesize hasVideo = _hasVideo;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize publishColor = _publishColor;
@synthesize showTime = _showTime;
@synthesize trackValue = _trackValue;
@synthesize itemsCount = _itemsCount;
@synthesize weekDayColor = _weekDayColor;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;
@synthesize actions = _actions;
@synthesize dayColor = _dayColor;
@synthesize showType = _showType;
@synthesize componentDescription = _componentDescription;


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
            self.monthColor = [self objectOrNilForKey:kZYComponentMonthColor fromDictionary:dict];
            self.showId = [self objectOrNilForKey:kZYComponentShowId fromDictionary:dict];
            self.weekDayBgUrl = [self objectOrNilForKey:kZYComponentWeekDayBgUrl fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kZYComponentPicUrl fromDictionary:dict];
            self.showTimeColor = [self objectOrNilForKey:kZYComponentShowTimeColor fromDictionary:dict];
            self.month = [self objectOrNilForKey:kZYComponentMonth fromDictionary:dict];
            self.xingQi = [self objectOrNilForKey:kZYComponentXingQi fromDictionary:dict];
            self.backgroundUrl = [self objectOrNilForKey:kZYComponentBackgroundUrl fromDictionary:dict];
            self.showTypeId = [self objectOrNilForKey:kZYComponentShowTypeId fromDictionary:dict];
            self.weekDay = [self objectOrNilForKey:kZYComponentWeekDay fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kZYComponentComponentType fromDictionary:dict];
            self.monthOnly = [self objectOrNilForKey:kZYComponentMonthOnly fromDictionary:dict];
            self.day = [self objectOrNilForKey:kZYComponentDay fromDictionary:dict];
            self.action = [ZYAction modelObjectWithDictionary:[dict objectForKey:kZYComponentAction]];
            self.year = [self objectOrNilForKey:kZYComponentYear fromDictionary:dict];
            self.hasVideo = [self objectOrNilForKey:kZYComponentHasVideo fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kZYComponentId fromDictionary:dict];
            self.publishColor = [self objectOrNilForKey:kZYComponentPublishColor fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kZYComponentShowTime fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kZYComponentTrackValue fromDictionary:dict];
            self.itemsCount = [self objectOrNilForKey:kZYComponentItemsCount fromDictionary:dict];
            self.weekDayColor = [self objectOrNilForKey:kZYComponentWeekDayColor fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kZYComponentCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kZYComponentCommentCount fromDictionary:dict];
    NSObject *receivedZYActions = [dict objectForKey:kZYComponentActions];
    NSMutableArray *parsedZYActions = [NSMutableArray array];
    if ([receivedZYActions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYActions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYActions addObject:[ZYActions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYActions isKindOfClass:[NSDictionary class]]) {
       [parsedZYActions addObject:[ZYActions modelObjectWithDictionary:(NSDictionary *)receivedZYActions]];
    }

    self.actions = [NSArray arrayWithArray:parsedZYActions];
            self.dayColor = [self objectOrNilForKey:kZYComponentDayColor fromDictionary:dict];
            self.showType = [self objectOrNilForKey:kZYComponentShowType fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kZYComponentDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.monthColor forKey:kZYComponentMonthColor];
    [mutableDict setValue:self.showId forKey:kZYComponentShowId];
    [mutableDict setValue:self.weekDayBgUrl forKey:kZYComponentWeekDayBgUrl];
    [mutableDict setValue:self.picUrl forKey:kZYComponentPicUrl];
    [mutableDict setValue:self.showTimeColor forKey:kZYComponentShowTimeColor];
    [mutableDict setValue:self.month forKey:kZYComponentMonth];
    [mutableDict setValue:self.xingQi forKey:kZYComponentXingQi];
    [mutableDict setValue:self.backgroundUrl forKey:kZYComponentBackgroundUrl];
    [mutableDict setValue:self.showTypeId forKey:kZYComponentShowTypeId];
    [mutableDict setValue:self.weekDay forKey:kZYComponentWeekDay];
    [mutableDict setValue:self.componentType forKey:kZYComponentComponentType];
    [mutableDict setValue:self.monthOnly forKey:kZYComponentMonthOnly];
    [mutableDict setValue:self.day forKey:kZYComponentDay];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kZYComponentAction];
    [mutableDict setValue:self.year forKey:kZYComponentYear];
    [mutableDict setValue:self.hasVideo forKey:kZYComponentHasVideo];
    [mutableDict setValue:self.componentIdentifier forKey:kZYComponentId];
    [mutableDict setValue:self.publishColor forKey:kZYComponentPublishColor];
    [mutableDict setValue:self.showTime forKey:kZYComponentShowTime];
    [mutableDict setValue:self.trackValue forKey:kZYComponentTrackValue];
    [mutableDict setValue:self.itemsCount forKey:kZYComponentItemsCount];
    [mutableDict setValue:self.weekDayColor forKey:kZYComponentWeekDayColor];
    [mutableDict setValue:self.collectionCount forKey:kZYComponentCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kZYComponentCommentCount];
    NSMutableArray *tempArrayForActions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.actions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActions] forKey:kZYComponentActions];
    [mutableDict setValue:self.dayColor forKey:kZYComponentDayColor];
    [mutableDict setValue:self.showType forKey:kZYComponentShowType];
    [mutableDict setValue:self.componentDescription forKey:kZYComponentDescription];

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

    self.monthColor = [aDecoder decodeObjectForKey:kZYComponentMonthColor];
    self.showId = [aDecoder decodeObjectForKey:kZYComponentShowId];
    self.weekDayBgUrl = [aDecoder decodeObjectForKey:kZYComponentWeekDayBgUrl];
    self.picUrl = [aDecoder decodeObjectForKey:kZYComponentPicUrl];
    self.showTimeColor = [aDecoder decodeObjectForKey:kZYComponentShowTimeColor];
    self.month = [aDecoder decodeObjectForKey:kZYComponentMonth];
    self.xingQi = [aDecoder decodeObjectForKey:kZYComponentXingQi];
    self.backgroundUrl = [aDecoder decodeObjectForKey:kZYComponentBackgroundUrl];
    self.showTypeId = [aDecoder decodeObjectForKey:kZYComponentShowTypeId];
    self.weekDay = [aDecoder decodeObjectForKey:kZYComponentWeekDay];
    self.componentType = [aDecoder decodeObjectForKey:kZYComponentComponentType];
    self.monthOnly = [aDecoder decodeObjectForKey:kZYComponentMonthOnly];
    self.day = [aDecoder decodeObjectForKey:kZYComponentDay];
    self.action = [aDecoder decodeObjectForKey:kZYComponentAction];
    self.year = [aDecoder decodeObjectForKey:kZYComponentYear];
    self.hasVideo = [aDecoder decodeObjectForKey:kZYComponentHasVideo];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kZYComponentId];
    self.publishColor = [aDecoder decodeObjectForKey:kZYComponentPublishColor];
    self.showTime = [aDecoder decodeObjectForKey:kZYComponentShowTime];
    self.trackValue = [aDecoder decodeObjectForKey:kZYComponentTrackValue];
    self.itemsCount = [aDecoder decodeObjectForKey:kZYComponentItemsCount];
    self.weekDayColor = [aDecoder decodeObjectForKey:kZYComponentWeekDayColor];
    self.collectionCount = [aDecoder decodeObjectForKey:kZYComponentCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kZYComponentCommentCount];
    self.actions = [aDecoder decodeObjectForKey:kZYComponentActions];
    self.dayColor = [aDecoder decodeObjectForKey:kZYComponentDayColor];
    self.showType = [aDecoder decodeObjectForKey:kZYComponentShowType];
    self.componentDescription = [aDecoder decodeObjectForKey:kZYComponentDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_monthColor forKey:kZYComponentMonthColor];
    [aCoder encodeObject:_showId forKey:kZYComponentShowId];
    [aCoder encodeObject:_weekDayBgUrl forKey:kZYComponentWeekDayBgUrl];
    [aCoder encodeObject:_picUrl forKey:kZYComponentPicUrl];
    [aCoder encodeObject:_showTimeColor forKey:kZYComponentShowTimeColor];
    [aCoder encodeObject:_month forKey:kZYComponentMonth];
    [aCoder encodeObject:_xingQi forKey:kZYComponentXingQi];
    [aCoder encodeObject:_backgroundUrl forKey:kZYComponentBackgroundUrl];
    [aCoder encodeObject:_showTypeId forKey:kZYComponentShowTypeId];
    [aCoder encodeObject:_weekDay forKey:kZYComponentWeekDay];
    [aCoder encodeObject:_componentType forKey:kZYComponentComponentType];
    [aCoder encodeObject:_monthOnly forKey:kZYComponentMonthOnly];
    [aCoder encodeObject:_day forKey:kZYComponentDay];
    [aCoder encodeObject:_action forKey:kZYComponentAction];
    [aCoder encodeObject:_year forKey:kZYComponentYear];
    [aCoder encodeObject:_hasVideo forKey:kZYComponentHasVideo];
    [aCoder encodeObject:_componentIdentifier forKey:kZYComponentId];
    [aCoder encodeObject:_publishColor forKey:kZYComponentPublishColor];
    [aCoder encodeObject:_showTime forKey:kZYComponentShowTime];
    [aCoder encodeObject:_trackValue forKey:kZYComponentTrackValue];
    [aCoder encodeObject:_itemsCount forKey:kZYComponentItemsCount];
    [aCoder encodeObject:_weekDayColor forKey:kZYComponentWeekDayColor];
    [aCoder encodeObject:_collectionCount forKey:kZYComponentCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kZYComponentCommentCount];
    [aCoder encodeObject:_actions forKey:kZYComponentActions];
    [aCoder encodeObject:_dayColor forKey:kZYComponentDayColor];
    [aCoder encodeObject:_showType forKey:kZYComponentShowType];
    [aCoder encodeObject:_componentDescription forKey:kZYComponentDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYComponent *copy = [[ZYComponent alloc] init];
    
    if (copy) {

        copy.monthColor = [self.monthColor copyWithZone:zone];
        copy.showId = [self.showId copyWithZone:zone];
        copy.weekDayBgUrl = [self.weekDayBgUrl copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.showTimeColor = [self.showTimeColor copyWithZone:zone];
        copy.month = [self.month copyWithZone:zone];
        copy.xingQi = [self.xingQi copyWithZone:zone];
        copy.backgroundUrl = [self.backgroundUrl copyWithZone:zone];
        copy.showTypeId = [self.showTypeId copyWithZone:zone];
        copy.weekDay = [self.weekDay copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.monthOnly = [self.monthOnly copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.hasVideo = [self.hasVideo copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.publishColor = [self.publishColor copyWithZone:zone];
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.itemsCount = [self.itemsCount copyWithZone:zone];
        copy.weekDayColor = [self.weekDayColor copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.actions = [self.actions copyWithZone:zone];
        copy.dayColor = [self.dayColor copyWithZone:zone];
        copy.showType = [self.showType copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
