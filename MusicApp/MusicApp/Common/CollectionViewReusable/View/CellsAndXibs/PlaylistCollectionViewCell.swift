//
//  PlaylistCollectionViewCell.swift
//  MusicApp
//
//  Created by Manish Solanki on 20/04/23.
//

import UIKit
import SDWebImage

//MARK: - Custom Cell Class
class PlaylistCollectionViewCell: UICollectionViewCell {
    //MARK: - Cell Identifier
    static let identifier = "PlaylistCollectionViewCell"
    
    //MARK: - Private Methods
    @IBOutlet weak var playlistImageView: UIImageView!
    @IBOutlet weak var playlistTitleLabel: UILabel!
    
    //MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: - Method to configure cell
    func configure(playlist: PlaylistCollectionViewData) {
        if let pictureURLString = playlist.picture, let url = URL(string: pictureURLString) {
            playlistImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "Person.Fill"))
            playlistTitleLabel.text = playlist.title
        } else {
            debugPrint("Image URL not found.")
        }
    }
}
