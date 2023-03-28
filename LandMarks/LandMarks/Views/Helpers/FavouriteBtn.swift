//
//  FavouriteBtn.swift
//  LandMarks
//
//  Created by abhishek on 27/03/23.
//

import SwiftUI

struct FavouriteBtn: View {
   //MARK: - Properties
    @Binding var isSet : Bool
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle-Image", systemImage: isSet ? "star-fill":"star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavouriteBtn_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteBtn(isSet: .constant(true))
    }
}
