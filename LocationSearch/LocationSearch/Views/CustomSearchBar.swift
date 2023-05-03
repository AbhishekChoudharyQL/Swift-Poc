//
//  CustomSearchBar.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI


struct CustomSearchBarView: View {
    @State var locationManager : LocationManager
    var body: some View {
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
    }
}

struct CustomSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBarView(locationManager: LocationManager())
    }
}
