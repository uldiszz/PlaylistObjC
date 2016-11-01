//
//  Song.m
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "Song.h"

@implementation Song

- (instancetype)initWithName:(NSString *)name artist:(NSString *)artist {
    self = [super init];
    if (self) {
        _name = name;
        _artist = artist;
    }
    return self;
}

@end
