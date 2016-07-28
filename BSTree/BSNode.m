//
//  BSNode.m
//  BSTree
//
//  Created by Mohamed EL Meseery on 7/28/16.
//  Copyright © 2016 Meseery. All rights reserved.
//

#import "BSNode.h"

#define KValueKey       @"value"
#define KLeftNodeKey    @"LeftNode"
#define KRightNodeKey   @"RightNode"

@implementation BSNode

-(instancetype)init
{
    self  = [super init];
    
    return self;
}

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        self.value = value;
        self.right = nil;
        self.left = nil;
    }
    return self;
}

#pragma mark - NSCoding Delegate

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.value forKey:KValueKey];
    [aCoder encodeObject:self.left forKey:KLeftNodeKey];
    [aCoder encodeObject:self.right forKey:KRightNodeKey];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.value = [aDecoder decodeObjectForKey:KValueKey];
        self.left = [aDecoder decodeObjectForKey:KLeftNodeKey];
        self.right = [aDecoder decodeObjectForKey:KRightNodeKey];
    }
    
    return self;
}

@end
