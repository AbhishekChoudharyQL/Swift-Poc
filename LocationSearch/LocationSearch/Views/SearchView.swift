//
//  SearchView.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var locationManager : LocationManager = .init()
    var body: some View {
        ZStack(content: {
            VStack(content: {
                SearchViewNavigationTitle()
                CustomSearchBarView(locationManager: locationManager)
                
            }).padding()
            .frame(maxHeight: .infinity,alignment: .top)
        }).background(Color.black)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}


