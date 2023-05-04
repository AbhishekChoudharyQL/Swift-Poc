//
//  MapSelectionView.swift
//  LocationSearch
//
//  Created by abhishek on 04/05/23.
//

import SwiftUI

struct MapSelectionView: View {
    
    //MARK: - Properties
    @EnvironmentObject var locationManager : LocationManager
    
    //MARK: - View Builder
    var body : some View {
        ZStack{
           MapViewHelper()
                .environmentObject(locationManager)
                .ignoresSafeArea()
            
        }
    }
}

//MARK: - Previews
struct MapSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MapSelectionView()
    }
}
