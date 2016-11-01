//
//  Song.h
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

- (instancetype)initWithName:(NSString *)name artist:(NSString *)artist;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artist;

@end
