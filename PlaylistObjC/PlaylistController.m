//
//  PlaylistController.m
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "PlaylistController.h"

@interface PlaylistController ()
@property (nonatomic, strong) NSMutableArray *internalPlaylists;
@end

@implementation PlaylistController

+ (PlaylistController *)sharedController {
    static PlaylistController *sharedController = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedController = [PlaylistController new];
    });
    
    return sharedController;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createPlaylistWithTitle:(NSString *)title {
    Playlist *playlist = [[Playlist alloc] initWithName:title songs:[[NSMutableArray alloc] init]];
    [self.internalPlaylists addObject:playlist];
}

- (void)deletePlaylist:(Playlist *)playlist {
    [self.internalPlaylists removeObject:playlist];
}

- (void)addSongWithTitle:(NSString *)title artist:(NSString *)artist toPlaylist:(Playlist *)playlist {
    Song *song = [[Song alloc] initWithName:title artist:artist];
    [playlist addSongsObject:song];
}

- (void)removeSong:(Song *)song fromPlaylist:(Playlist *)playlist {
    [playlist removeSongsObject:song];
}

- (NSArray *)playlists { return self.internalPlaylists; }

@end
