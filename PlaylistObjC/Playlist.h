//
//  Playlist.h
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Song;

@interface Playlist : NSObject

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSArray *songs;

- (void)addSongsObject:(Song *)song;
- (void)removeSongsObject:(Song *)song;

@end
