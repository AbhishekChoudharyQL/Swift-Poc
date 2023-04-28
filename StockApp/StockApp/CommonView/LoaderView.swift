//
//  LoaderView.swift
//  StockApp
//
//  Created by abhishek on 28/04/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
            ProgressView()
                .background(Color.clear)
                .progressViewStyle(CircularProgressViewStyle(tint: .green))
                .scaleEffect(4)
                
            
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
