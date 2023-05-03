//
//  SearchView.swift
//  LocationSearch
//
//  Created by abhishek on 03/05/23.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: - Properties
    @StateObject var locationManager : LocationManager = .init()
    var body: some View {
        ZStack(content: {
            VStack(content: {
                //MARK: Reusable Components..
            SearchViewNavigationTitle()
            CustomSearchBarView(locationManager: locationManager)
            if let places = locationManager.fetchedPlaces , !(places.isEmpty){
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading,spacing: 30,content: {
                        ForEach(places,id: \.self){
                            place in
                            HStack(spacing: 15,content: {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    Text(place.name ?? "")
                                        .font(.callout.bold())
                                        .foregroundColor(.white)
                                     Spacer()
                                    Text(place.locality ?? "")
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.5))
                                    })
                                }
                            })
                        }
                    }
                
                else{
                Button {
                  print("current location btn is tapped")
                } label: {
                    Label {
                        Text("Use Current Location")
                            .font(.callout)
                    } icon: {
                        Image(systemName: "location.north.circle.fill")
                    }
                }.foregroundColor(.green)
                    .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
                }
            }).padding()
            .frame(maxHeight: .infinity,alignment: .top)
        }).background(Color.black)
    }
}

//MARK: - Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}


