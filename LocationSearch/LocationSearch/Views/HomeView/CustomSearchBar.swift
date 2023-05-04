//
//  CustomSearchBar.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI


struct CustomSearchBarView: View {
    
    //MARK: - Properties
    @State var locationManager : LocationManager
    
    //MARK: - View Builder
    var body: some View {
        HStack(content: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.trailing , 50)
            TextField("", text: $locationManager.searchText, prompt: Text("Search Places...").foregroundColor(.white)).foregroundColor(.white)
        })
        //MARK: - This was new approach of to achieve debounce without combine , will delete later..
//        .onReceive(locationManager.$searchText, perform: { updatedTextValue in
//            if updatedTextValue != "" && updatedTextValue.count >= 3 {
//                    locationManager.fetchPlaces(value: updatedTextValue)
//                } else {
//                    locationManager.fetchedPlaces = nil
//                }
//        })
        .padding(.vertical,12)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .strokeBorder(.gray)
        }
    }
}

//MARK: - Previews
struct CustomSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBarView(locationManager: LocationManager())
    }
}
