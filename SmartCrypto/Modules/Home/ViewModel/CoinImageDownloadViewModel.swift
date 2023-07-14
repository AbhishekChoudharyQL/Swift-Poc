//
//  CoinImageDownloadViewModel.swift
//  SmartCrypto
//
//  Created by abhishek on 14/07/23.
//

import Foundation
import SwiftUI



class CoinImageDownloadViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var coinImage : UIImage? = nil
    @Published var isLoading : Bool = false
    
    init(){
       getImage()
    }
    
    //MARK: - Private Methods
    private func getImage(){
    
        
    }
}

