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
        collectionView.backgroundColor = .clear
        collectionView.register(PlaylistCell.self, forCellWithReuseIdentifier: "PlaylistyCell")
        return collectionView
    }
    //MARK: - Methods to update and reload collectionView
    func updateUIView(_ collectionView: UICollectionView, context: Context) {
        // Update the collection view data
        context.coordinator.playlistData = playlistData
        collectionView.reloadData()
    }

    internal func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    //MARK: - setting up data source and delegate
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

        let parent: PlaylistCollectionView
        var playlistData: [PlaylistResponse] = []

        init(_ parent: PlaylistCollectionView) {
            self.parent = parent
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print("\(playlistData.count):")
            return playlistData.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
            cell.configure(with: playlistData[indexPath.item])
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width/2
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        }
    }

}
 //MARK: - Custom Cell Class
  class PlaylistCell: UICollectionViewCell {
    static let identifier = "PlaylistCell"
    let imageView = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        titleLabel.frame = CGRect(x: 0, y: contentView.bounds.height - 40, width: contentView.bounds.width, height: 40)
    }

    func configure(with playlistResponse: PlaylistResponse) {
         let imageURL = URL(string: playlistResponse.data?.first?.picture ?? "")
        if let imageURL = imageURL {
            AsyncImageModifierForPlaylist(imageUrl: imageURL)
                .frame(maxWidth: .infinity,maxHeight: 200)
        } else {
            DefaultPlaceholderImage()
                .frame(maxWidth: .infinity, maxHeight: 200)
        }
        TextModifierForSmallCaptions(texttoBeModified: playlistResponse.data?.first?.title ?? "")
            .frame(maxWidth: .infinity)
    }

}
//
