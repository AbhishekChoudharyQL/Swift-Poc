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
    @State private var showPopUp = false
    
    //MARK: - View Builder
    var body: some View {
        NavigationStack {
            List(reciepeViewModel.reciepes, id: \.name) { reciepe in
                Text(reciepe.name)
                    .foregroundColor(.pink)
            } .toolbarBackground(Color.green, for: .navigationBar)
            .navigationBarItems(
                trailing: HStack {
                    Button {
                       dismiss()
                    } label: {
                        Text("Back To Home")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    Spacer().frame(width: 150)
                    Button(action: {
                        showPopUp.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    })
                    .padding()
                }
            )
            .sheet(isPresented: $showPopUp){
            AddReciepeView(reciepeViewModel: reciepeViewModel,
                           reciepe: Reciepe(name: "banana", ingredient: "milk"))
            }
        }
    }
}

 //MARK: - Previews
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(reciepeViewModel: ReciepeViewModel())
    }
}
