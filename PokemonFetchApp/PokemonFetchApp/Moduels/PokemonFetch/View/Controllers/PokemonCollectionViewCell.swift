//
//  PokemonCollectionViewCell.swift
//  PokemonFetchApp
//
//  Created by abhishek on 17/03/23.
//

import UIKit



class PokemonCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    
    @IBOutlet weak var mainContentView : UIView!
    @IBOutlet weak var cardBackgroundImageView:UIImageView!
    
    //MARK: - Properties
    var pokemonData: Pokemon? {
        didSet {
            if let pokemonData = pokemonData {
                setup(using: pokemonData)
            }
        }
    }
    
    //MARK: - Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMainViewUI()
    }
    
    //MARK: - Private methods
    
    private func setupMainViewUI() {
        mainContentView.clipsToBounds = false
        
        
        // setupMain ContentView
        addCornerCurves(to: mainContentView)
        addCornerCurves(to: cardBackgroundImageView)
        addShadow(to: mainContentView)
        addBorder(to: mainContentView)
        
        addShadow(to: pokemonImageView)
        addShadow(to: pokemonNameLabel)
    }
    
    private func addShadow(to view: UIView) {
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        
        view.layer.shadowColor = UIColor.cyan.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 1
    }
    
    private func addBorder(to view: UIView) {
        view.layer.borderColor = UIColor.magenta.cgColor
        view.layer.borderWidth = 2
    }
    
    private func addCornerCurves(to view: UIView) {
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 48
    }
    
    private func setup(using pokemonData: Pokemon) {
        // set name on label
        if let name = pokemonData.name {
            self.pokemonNameLabel.text = name
        }
        
        // fetching data from api
        guard let Url = URL(string: pokemonData.url) else {print("failed to extract URL"); return }
        
        URLSession.shared.dataTask(with: Url) {
            data,response, error in
            guard let data = data else {print("Failed to extract data"); return }

            do {
                let jsonresposne = try JSONDecoder().decode(PokemonData.self, from: data)
                
                DispatchQueue.main.async {
                    //Set data on view
                    self.pokemonHeightLabel.text = "Height: \(jsonresposne.height)"
                    self.pokemonWeightLabel.text = "Weight: \(jsonresposne.weight)"
                    self.pokemonIDLabel.text = "ID: \(jsonresposne.id)"
                    self.setupImage(from: jsonresposne.sprites.other?.officialArtwork?.front_default	)
                }
                
                
            } catch let error  {
                print("cathing error: \(error)")
            }
        }.resume()
    }
    
    private func setupImage(from url: String?) {
        
        
        guard let urlString = url,
                let imageUrl = URL(string: urlString)
        else {print("unable to extract image url"); return}
        
        URLSession.shared.dataTask(with: imageUrl) { imageData, URLResponse, apiError in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    self.pokemonImageView.image = UIImage(data: imageData)
                }
                
            } else {
                print(URLResponse)
                print(apiError)
            }
        }.resume()
        
        
    }
}


