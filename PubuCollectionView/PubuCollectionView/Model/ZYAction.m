//
//  ZYAction.m
//
//  Created by   on 15/4/21
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYAction.h"
#import "ZYItemPicUrlList.h"


NSString *const kZYActionId = @"id";
NSString *const kZYActionTrackValue = @"trackValue";
NSString *const kZYActionVideoUrl = @"videoUrl";
NSString *const kZYActionItemPicUrlList = @"itemPicUrlList";
NSString *const kZYActionDescription = @"description";
NSString *const kZYActionWidth = @"width";
NSString *const kZYActionTitle = @"title";
NSString *const kZYActionUserId = @"userId";
NSString *const kZYActionUserName = @"userName";
NSString *const kZYActionActionType = @"actionType";
NSString *const kZYActionCollectionCount = @"collectionCount";
NSString *const kZYActionHeight = @"height";
NSString *const kZYActionCommentCount = @"commentCount";
NSString *const kZYActionUserPicUrl = @"userPicUrl";
NSString *const kZYActionNormalPicUrl = @"normalPicUrl";
NSString *const kZYActionDateTime = @"dateTime";


@interface ZYAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYAction

@synthesize actionIdentifier = _actionIdentifier;
@synthesize trackValue = _trackValue;
@synthesize videoUrl = _videoUrl;
@synthesize itemPicUrlList = _itemPicUrlList;
@synthesize actionDescription = _actionDescription;
@synthesize width = _width;
@synthesize title = _title;
@synthesize userId = _userId;
@synthesize userName = _userName;
@synthesize actionType = _actionType;
@synthesize collectionCount = _collectionCount;
@synthesize height = _height;
@synthesize commentCount = _commentCount;
@synthesize userPicUrl = _userPicUrl;
@synthesize normalPicUrl = _normalPicUrl;
@synthesize dateTime = _dateTime;


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
            self.actionIdentifier = [self objectOrNilForKey:kZYActionId fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kZYActionTrackValue fromDictionary:dict];
            self.videoUrl = [self objectOrNilForKey:kZYActionVideoUrl fromDictionary:dict];
    NSObject *receivedZYItemPicUrlList = [dict objectForKey:kZYActionItemPicUrlList];
    NSMutableArray *parsedZYItemPicUrlList = [NSMutableArray array];
    if ([receivedZYItemPicUrlList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYItemPicUrlList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYItemPicUrlList addObject:[ZYItemPicUrlList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYItemPicUrlList isKindOfClass:[NSDictionary class]]) {
       [parsedZYItemPicUrlList addObject:[ZYItemPicUrlList modelObjectWithDictionary:(NSDictionary *)receivedZYItemPicUrlList]];
    }

    self.itemPicUrlList = [NSArray arrayWithArray:parsedZYItemPicUrlList];
            self.actionDescription = [self objectOrNilForKey:kZYActionDescription fromDictionary:dict];
            self.width = [self objectOrNilForKey:kZYActionWidth fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZYActionTitle fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kZYActionUserId fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kZYActionUserName fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kZYActionActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kZYActionCollectionCount fromDictionary:dict];
            self.height = [self objectOrNilForKey:kZYActionHeight fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kZYActionCommentCount fromDictionary:dict];
            self.userPicUrl = [self objectOrNilForKey:kZYActionUserPicUrl fromDictionary:dict];
            self.normalPicUrl = [self objectOrNilForKey:kZYActionNormalPicUrl fromDictionary:dict];
            self.dateTime = [self objectOrNilForKey:kZYActionDateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionIdentifier forKey:kZYActionId];
    [mutableDict setValue:self.trackValue forKey:kZYActionTrackValue];
    [mutableDict setValue:self.videoUrl forKey:kZYActionVideoUrl];
    NSMutableArray *tempArrayForItemPicUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemPicUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemPicUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemPicUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemPicUrlList] forKey:kZYActionItemPicUrlList];
    [mutableDict setValue:self.actionDescription forKey:kZYActionDescription];
    [mutableDict setValue:self.width forKey:kZYActionWidth];
    [mutableDict setValue:self.title forKey:kZYActionTitle];
    [mutableDict setValue:self.userId forKey:kZYActionUserId];
    [mutableDict setValue:self.userName forKey:kZYActionUserName];
    [mutableDict setValue:self.actionType forKey:kZYActionActionType];
    [mutableDict setValue:self.collectionCount forKey:kZYActionCollectionCount];
    [mutableDict setValue:self.height forKey:kZYActionHeight];
    [mutableDict setValue:self.commentCount forKey:kZYActionCommentCount];
    [mutableDict setValue:self.userPicUrl forKey:kZYActionUserPicUrl];
    [mutableDict setValue:self.normalPicUrl forKey:kZYActionNormalPicUrl];
    [mutableDict setValue:self.dateTime forKey:kZYActionDateTime];

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

    self.actionIdentifier = [aDecoder decodeObjectForKey:kZYActionId];
    self.trackValue = [aDecoder decodeObjectForKey:kZYActionTrackValue];
    self.videoUrl = [aDecoder decodeObjectForKey:kZYActionVideoUrl];
    self.itemPicUrlList = [aDecoder decodeObjectForKey:kZYActionItemPicUrlList];
    self.actionDescription = [aDecoder decodeObjectForKey:kZYActionDescription];
    self.width = [aDecoder decodeObjectForKey:kZYActionWidth];
    self.title = [aDecoder decodeObjectForKey:kZYActionTitle];
    self.userId = [aDecoder decodeObjectForKey:kZYActionUserId];
    self.userName = [aDecoder decodeObjectForKey:kZYActionUserName];
    self.actionType = [aDecoder decodeObjectForKey:kZYActionActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kZYActionCollectionCount];
    self.height = [aDecoder decodeObjectForKey:kZYActionHeight];
    self.commentCount = [aDecoder decodeObjectForKey:kZYActionCommentCount];
    self.userPicUrl = [aDecoder decodeObjectForKey:kZYActionUserPicUrl];
    self.normalPicUrl = [aDecoder decodeObjectForKey:kZYActionNormalPicUrl];
    self.dateTime = [aDecoder decodeObjectForKey:kZYActionDateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionIdentifier forKey:kZYActionId];
    [aCoder encodeObject:_trackValue forKey:kZYActionTrackValue];
    [aCoder encodeObject:_videoUrl forKey:kZYActionVideoUrl];
    [aCoder encodeObject:_itemPicUrlList forKey:kZYActionItemPicUrlList];
    [aCoder encodeObject:_actionDescription forKey:kZYActionDescription];
    [aCoder encodeObject:_width forKey:kZYActionWidth];
    [aCoder encodeObject:_title forKey:kZYActionTitle];
    [aCoder encodeObject:_userId forKey:kZYActionUserId];
    [aCoder encodeObject:_userName forKey:kZYActionUserName];
    [aCoder encodeObject:_actionType forKey:kZYActionActionType];
    [aCoder encodeObject:_collectionCount forKey:kZYActionCollectionCount];
    [aCoder encodeObject:_height forKey:kZYActionHeight];
    [aCoder encodeObject:_commentCount forKey:kZYActionCommentCount];
    [aCoder encodeObject:_userPicUrl forKey:kZYActionUserPicUrl];
    [aCoder encodeObject:_normalPicUrl forKey:kZYActionNormalPicUrl];
    [aCoder encodeObject:_dateTime forKey:kZYActionDateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYAction *copy = [[ZYAction alloc] init];
    
    if (copy) {

        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
        copy.itemPicUrlList = [self.itemPicUrlList copyWithZone:zone];
        copy.actionDescription = [self.actionDescription copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.userPicUrl = [self.userPicUrl copyWithZone:zone];
        copy.normalPicUrl = [self.normalPicUrl copyWithZone:zone];
        copy.dateTime = [self.dateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
