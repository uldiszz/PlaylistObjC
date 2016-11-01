//
//  PlaylistTableViewController.m
//  PlaylistObjC
//
//  Created by Uldis Zingis on 31/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

#import "PlaylistTableViewController.h"
#import "PlaylistController.h"
#import "SongDetailTableViewController.h"

@interface PlaylistTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@end

@implementation PlaylistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(id)sender {
    [[PlaylistController sharedController] createPlaylistWithTitle:self.nameTextField.text];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[PlaylistController sharedController].playlists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    Playlist *playlist = [PlaylistController sharedController].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Playlist *playlist = [PlaylistController sharedController].playlists[indexPath.row];
        
        [[PlaylistController sharedController] deletePlaylist:playlist];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailView"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Playlist *playlist = [PlaylistController sharedController].playlists[indexPath.row];
        
        SongDetailTableViewController *nextVC = [segue destinationViewController];
        nextVC.playlist = playlist;
    }
}

@end








