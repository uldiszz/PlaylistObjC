//
//  Playlist.m
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "Playlist.h"

@interface Playlist ()
@property (nonatomic, strong) NSMutableArray *internalSongs;
@end

@implementation Playlist

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs {
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

- (NSArray *)songs { return self.internalSongs; }

- (void)addSongsObject:(Song *)song {
    [self.internalSongs addObject:song];
}

- (void)removeSongsObject:(Song *)song {
    [self.internalSongs removeObject:song];
}

@end
