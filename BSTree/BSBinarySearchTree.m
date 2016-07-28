//
//  BSBinarySearchTree.m
//  BSTree
//
//  Created by Mohamed EL Meseery on 7/28/16.
//  Copyright © 2016 Meseery. All rights reserved.
//

#import "BSBinarySearchTree.h"

#define kRootKey    @"root"

@implementation BSBinarySearchTree 

#pragma mark - NSCoding Delegate

-(void)encodeWithCoder:(NSCoder *)aCoder{
    if(self.root!=nil)
    {
        [aCoder encodeObject:self.root forKey:kRootKey];
    }
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.root = [decoder decodeObjectForKey:kRootKey];
    }
    return self;
}

- (void)insertNodeWithValue:(id)value {
    [BSBinarySearchTree insertNode:self.root withValue:value];
}

+ (BSNode*)insertNode:(BSNode*)root withValue:(id)value{
    BSNode * node = [[BSNode alloc]initWithValue:value];
    
    if (!root) {
        root = node;
    }
    if (value > root.value) {
        root.right = [BSBinarySearchTree insertNode:root.right withValue:value];
    }else{
        root.left = [BSBinarySearchTree insertNode:root.left withValue:value];
    }
    
    return node;
    
}

+ (id)maxValue:(BSNode *)root {
    
    BSNode * current = root;
    
    if (!root) {
        return nil;
    }
    
    while (current.right != nil) {
        current = current.right;
    }
    
    return current.value;
    
}

+ (id)minValue:(BSNode *)root {
    
    BSNode * current = root;
    
    if (!root) {
        return nil;
    }
    
    while (current.left != nil) {
        current = current.left;
    }
    
    return current.value;
    
}
+ (int)size:(BSNode*)root{
    
    int count = 1;
    if (!root) {
        return 0;
    }
    
    count += [BSBinarySearchTree size:root.left];
    count += [BSBinarySearchTree size:root.right];
    
    return count;
}


+ (instancetype)treeWithFile:(NSString*)path{
    
    if (path == nil || [path length]==0 || ![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return nil;
    }
    
    BSBinarySearchTree * tree = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return tree;
}

- (BOOL)saveTreeToPath:(NSString*)path{
    
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

@end
