//
//  SongDetailTableViewController.m
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "SongDetailTableViewController.h"
#import "PlaylistController.h"

@interface SongDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *songNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *songArtistTextField;
@end

@implementation SongDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addButtonTapped:(id)sender {
    [[PlaylistController sharedController] addSongWithTitle:self.songNameTextField.text artist:self.songArtistTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    Song *song = self.playlist.songs[indexPath.row];
    cell.textLabel.text = song.name;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Song *song = self.playlist.songs[indexPath.row];
        
        [[PlaylistController sharedController] removeSong:song fromPlaylist:self.playlist];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
