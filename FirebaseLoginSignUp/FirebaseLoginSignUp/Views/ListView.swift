//
//  ListView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 10/05/23.
//

import SwiftUI

struct ListView: View {
    
    //MARK: - Properties
    @ObservedObject var reciepeViewModel: ReciepeViewModel
    @Environment(\.dismiss) var dismiss
    
    //MARK: - View Builder
    var body: some View {
        NavigationView {
            List(reciepeViewModel.reciepes, id: \.name) { reciepe in
                Text(reciepe.name)
                    .foregroundColor(.pink)
            }
            .navigationBarItems(
                trailing: HStack {
                    Button {
                       dismiss()
                    } label: {
                        Text("Back To Home")
                            .foregroundColor(.pink)
                    }
                    .padding()
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                    })
                    Spacer()
                }
            )
        }
    }
}

 //MARK: - Previews
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(reciepeViewModel: ReciepeViewModel())
    }
}
