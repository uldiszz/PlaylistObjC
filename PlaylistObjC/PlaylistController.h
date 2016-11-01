//
//  PlaylistController.h
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "Playlist.h"
//@class Playlist;

@interface PlaylistController : NSObject

+ (PlaylistController *)sharedController;

- (instancetype)init;

- (void)createPlaylistWithTitle:(NSString *)title;
- (void)deletePlaylist:(Playlist *)playlist;
- (void)addSongWithTitle:(NSString *)title artist:(NSString *)artist toPlaylist: (Playlist *)playlist;
- (void)removeSong:(Song *)song fromPlaylist:(Playlist *)playlist;

@property (nonatomic, strong, readonly) NSArray *playlists;

@end
