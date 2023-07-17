//
//  SearchBarView.swift
//  SmartCrypto
//
//  Created by abhishek on 17/07/23.
//

import SwiftUI

struct SearchBarView: View {
    
    //MARK: - Properties
    @Binding var searchText : String
    
    //MARK: - View Builder
    var body: some View {
        
        HStack(content: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryTextColor :
                        Color.theme.accentColor
                )
            TextField("Search by name or symbol", text: $searchText)
                .foregroundColor(Color.theme.accentColor)
                .autocorrectionDisabled(true)
                .overlay(alignment: .trailing, content: {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                })
        }).font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.backgroundColor)
                    .shadow(color: Color.theme.accentColor.opacity(0.15), radius: 10,x: 0,y: 0)
            ).padding()
        
    }
}

//MARK: - Previews
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
