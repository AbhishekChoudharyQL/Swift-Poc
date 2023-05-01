//
//  LoaderView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct LoaderView: View {
    //MARK: - View Builder
    var body: some View {
            ProgressView()
                .background(Color.clear)
                .progressViewStyle(CircularProgressViewStyle(tint: .green))
                .scaleEffect(1.5)
    }
}
 
   //MARK: - Previews
struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
