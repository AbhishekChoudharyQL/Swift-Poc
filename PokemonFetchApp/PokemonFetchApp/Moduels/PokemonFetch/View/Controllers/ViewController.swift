//
//  ViewController.swift
//  PokemonFetchApp
//
//  Created by abhishek on 17/03/23.
//

import UIKit


class ViewController: UIViewController {

   
    //MARK: - IBOutlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var pokemonList: [Pokemon] = []
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let nib =  UINib(nibName: "PokemonCollectionViewCell", bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonCollectionViewCell")
        fetchPokemonList()
       
    }

    //MARK: - PUBLIC METHODS
    func fetchPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let pokemonListResponse = try decoder.decode(PokemonListResponse.self, from: data)
                self.pokemonList = pokemonListResponse.results
                print(self.pokemonList)
                // fetchedUrl = pokemonList.url
                DispatchQueue.main.async {
                    self.myCollectionView.reloadData()
                }
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
        self.myCollectionView.reloadData()
    }
}

//MARK: - EXTENSIONS
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonList.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        
        cell.pokemonData = pokemonList[indexPath.row]
        
        
        return cell
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = (collectionView.frame.height)
        //let height = 200
        let width = (collectionView.frame.width)
        
        return CGSize(width: width, height: height)
    }
}
