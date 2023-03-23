//
//  ViewController.swift
//  PokemonFetchApp
//
//  Created by abhishek on 17/03/23.
//

import UIKit


class PokemonCardsViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var allPokemons : [PokemonData] = []
    
    let pokemonCardsViewModel : PokemonCardsViewModel = PokemonCardsViewModel()
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMyCollectionView()
        loadData()
    }
    
    //MARK: - Private methods
    private func setupMyCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let nib =  UINib(nibName: "PokemonCollectionViewCell", bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    private func loadData() {
        //TODO: show activity indicator
        pokemonCardsViewModel.getPokemonData { [weak self] allPokemons in
            guard let weakSelf = self else {print("Self not available"); return}
            
            weakSelf.allPokemons = allPokemons
            DispatchQueue.main.async {
                weakSelf.myCollectionView.reloadData()
            }
            
            //TODO: hide activity indicator
        }
    }
}

//MARK: - EXTENSIONS
extension PokemonCardsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPokemons.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        cell.pokemonData = allPokemons[indexPath.row]
        
        return cell
    }
    
    
}
extension PokemonCardsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = (collectionView.frame.height)
        //let height = 200
        let width = (collectionView.frame.width)
        
        return CGSize(width: width, height: height)
    }
}
