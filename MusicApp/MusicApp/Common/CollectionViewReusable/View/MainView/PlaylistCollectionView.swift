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
    @Binding var playlistData : [PlaylistCollectionViewData]
    
    //MARK: - Making up of collectionView
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        collectionView.delegate = context.coordinator.self
        collectionView.dataSource = context.coordinator.self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isSpringLoaded = false
        collectionView.isScrollEnabled = false
        
        let playlistCellNib = UINib(nibName: "PlaylistCollectionViewCell", bundle: nil)
        
        collectionView.register(playlistCellNib, forCellWithReuseIdentifier: "PlaylistCollectionViewCell")
        
        let edgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 200, right: 0)
        collectionView.contentInset = edgeInsets
        
        
        
        return collectionView
    }
    //MARK: - Method to update UIView
    func updateUIView(_ collectionView: UICollectionView, context: Context) {
        collectionView.reloadData()
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCollectionViewCell", for: indexPath) as! PlaylistCollectionViewCell
            
            let playlist = parent.playlistData[indexPath.row]
            cell.configure(playlist: playlist)
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionView.frame.width / 2)
            return CGSize(width: size, height: size)
        }
    }
}
