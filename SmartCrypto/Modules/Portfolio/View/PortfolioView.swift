//
//  PortfolioView.swift
//  SmartCrypto
//
//  Created by abhishek on 18/07/23.
//

import SwiftUI

struct PortfolioView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel : HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - View Builder
    var body: some View {
        NavigationView(content: {
            ScrollView{
                VStack(alignment: .leading,spacing: 0, content: {
                    
                })
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton(presentationMode: _presentationMode)
                        
                }
            }
        })
    }
}

//MARK: - Previews
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}


