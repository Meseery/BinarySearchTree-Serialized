//
//  BSBinarySearchTree.h
//  BSTree
//
//  Created by Mohamed EL Meseery on 7/28/16.
//  Copyright © 2016 Meseery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSNode.h"

@interface BSBinarySearchTree : NSObject <NSCoding>

@property (strong, nonatomic) BSNode * root;
- (void)insertNodeWithValue:(id)value;

+ (BSNode*)insertNode:(BSNode*)root withValue:(id)value;
+ (id)minValue:(BSNode*)root;
+ (id)maxValue:(BSNode*)root;
+ (int)size:(BSNode*)root;

+ (instancetype)treeWithFile:(NSString*)path;
- (BOOL)saveTreeToPath:(NSString*)path;


@end
