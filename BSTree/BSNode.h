//
//  BSNode.h
//  BSTree
//
//  Created by Mohamed EL Meseery on 7/28/16.
//  Copyright © 2016 Meseery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSNode : NSObject <NSCoding>

@property (strong, nonatomic) id value;
@property (strong, nonatomic) BSNode * right;
@property (strong, nonatomic) BSNode * left;

- (instancetype)initWithValue:(id)value;

@end
