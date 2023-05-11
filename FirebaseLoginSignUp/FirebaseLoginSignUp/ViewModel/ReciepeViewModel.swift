//
//  ReciepeViewModel.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 10/05/23.
//

import Foundation
import Firebase

class ReciepeViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var reciepes : [Reciepe] = []
    
    //MARK: - Intializer
    init(){
        fetchReciepe()
    }
    
    //MARK: - Private Method
    private func fetchReciepe(){
        reciepes.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Reciepes")
        ref.getDocuments {
            snapshot , error in
            guard error == nil else{
                print(error?.localizedDescription as Any)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? "No Reciepe"
                    let ingredients = data["ingredient"] as? String ?? ""
                    let reciepe = Reciepe(name: name, ingredient: ingredients)
                    self.reciepes.append(reciepe)
                    print(self.reciepes)
                }
            }
        }
    }
}
