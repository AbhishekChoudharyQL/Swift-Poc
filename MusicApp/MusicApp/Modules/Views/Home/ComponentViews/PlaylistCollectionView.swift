//
//  PlaylistCollectionView.swift
//  MusicApp
//
//  Created by abhishek on 18/04/23.
//

import SwiftUI
import UIKit

struct PlaylistCollectionView: UIViewRepresentable {
    //MARK: - Properties
    @Binding var playlistData: [PlaylistResponse]
    
    //MARK: - Making up of collectionView
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PlaylistCell.self, forCellWithReuseIdentifier: "PlaylistCell")
        return collectionView
    }
    //MARK: - Method to update UIView
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    //MARK: - setting up data source and delegate protocols methods
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        var parent: PlaylistCollectionView
        
        init(_ collectionView: PlaylistCollectionView) {
            self.parent = collectionView
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.playlistData.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
            let playlist = parent.playlistData[indexPath.row]
            cell.configure(playlist: playlist)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = UIScreen.main.bounds.width - 32
            let height: CGFloat = 200
            return CGSize(width: width, height: height)
        }
    }
}
//MARK: - Custom Cell Class
class PlaylistCell: UICollectionViewCell {
    //MARK: - Cell Identifier
    static let identifier = "PlaylistCell"
    //MARK: - Private Methods
    private var playlistImageView: UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }
    private var playlistTitleLabel: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        return label
    }

    //MARK: - Method to configure cell
    func configure(playlist: PlaylistResponse) {
        playlistTitleLabel.text = playlist.data?.first?.title
        playlistImageView.image = UIImage(named: (playlist.data?.first?.picture)!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(playlistImageView)
        contentView.addSubview(playlistTitleLabel)
        
        playlistImageView.translatesAutoresizingMaskIntoConstraints = false
        playlistTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
