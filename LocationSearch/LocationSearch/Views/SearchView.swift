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
                HStack(content: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(.trailing , 50)
                    TextField("", text: $locationManager.searchText, prompt: Text("Search Places...").foregroundColor(.white))
                }).padding(.vertical,12)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .strokeBorder(.gray)
                    }
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

