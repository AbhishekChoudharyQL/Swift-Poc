//
//  ExploreView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct ExploreView: View {
    
    //MARK: - Grid item property
    var items : [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120),spacing: 50), count: 2)
    }
    
    // MARK: - View Builder
    var body: some View {
        VStack(spacing: 15){
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: items, spacing: 50){
                    ForEach(exploreData,id: \.title){
                        data in
                        MostBoughtViewComponent(image: data.image,title: data.title,currentValue: data.currentValue,changedStatus: data.changedStatus,isNegative: data.isNegative)
                    }
                }.padding(.horizontal,20)
            }
        }
    }
}

 //MARK: - Previews
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
