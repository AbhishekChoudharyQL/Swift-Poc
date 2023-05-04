//
//  AnnotationData.swift
//  LocationSearch
//
//  Created by abhishek on 04/05/23.
//

import SwiftUI

struct AnnotationData: View {
    
    //MARK: - Properties
    @StateObject var locationManager : LocationManager
    
        //MARK: - View Builder
    var body: some View {
        if let places = locationManager.pickedPlaceMark{
            VStack(spacing: 15,content: {
                Text("Confirm Location")
                    .font(.title2.bold())
                HStack(spacing: 15, content: {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                    VStack(alignment: .leading, content: {
                        Text(places.name ?? "")
                            .font(.title3.bold())
                        Text(places.locality ?? "")
                            .foregroundColor(.cyan)
                    })
                })
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical,10)
                Button {
                    
                } label: {
                    Text("Confirm Location")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,12)
                        .background {
                            RoundedRectangle(cornerRadius:  10,style: .continuous)
                                .fill(.green)
                        }
                        .overlay(alignment: .trailing){
                            Image(systemName: "arrow.right")
                                .font(.title3.bold())
                                .padding(.trailing)
                        }.foregroundColor(.white)
                }

            })
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .fill(.white)
            }.frame(maxWidth: .infinity,alignment: .bottom)
        }
    }
}

//MARK: - Previews
struct AnnotationData_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationData(locationManager: LocationManager())
    }
}
