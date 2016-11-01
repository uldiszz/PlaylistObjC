//
//  SongDetailTableViewController.h
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Playlist.h"

@interface SongDetailTableViewController : UITableViewController

@property (nonatomic, strong) Playlist *playlist;

@end
