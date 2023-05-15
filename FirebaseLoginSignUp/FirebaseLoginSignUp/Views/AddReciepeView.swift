//
//  AddReciepeView.swift
//  FirebaseLoginSignUp
//
//  Created by abhishek on 11/05/23.
//

import SwiftUI


struct AddReciepeView: View {
    
    //MARK: - Properties
    @ObservedObject var reciepeViewModel: ReciepeViewModel
    @State var reciepeName: String = ""
    @State var reciepeIngredient: String = ""
    @Environment(\.dismiss) var dismiss
    var reciepe: Reciepe
    
    //MARK: - View Builder
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0){
                GifImage("gif")
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height/4)
                }
                Text("Save Your Reciepe")
                    .foregroundColor(.white)
                    .font(.title)
                    .underline()
                    .padding(.top,40)
                VStack{
                    TextField("Recipe Name", text: $reciepeName, axis: .vertical)
                            .foregroundColor(.pink)
                            .lineLimit(2, reservesSpace: true)
                            .background(AppColor.topGradientColor.opacity(0.5))
                            .textFieldStyle(.roundedBorder)
                            .border(.pink)
                            .padding()
                    TextField("Ingredients", text: $reciepeIngredient,
                              axis: .vertical)
                            .background(Color.orange)
                            .foregroundColor(.pink)
                            .lineLimit(5, reservesSpace: true)
                           
                            .textFieldStyle(.roundedBorder)
                            .padding()
                        CustomButton(text: "Save Reciepe", action: {
                            let _ = print("reciepeName")
                            let _ = print("reciepeIngredient")
                            let newReciepe = Reciepe(name: reciepeName,
                                             ingredient: reciepeIngredient)
                            reciepeViewModel.addReciepe(newReciepe: newReciepe)
                            reciepeViewModel.fetchReciepe()
                            dismiss()
                        })
                }.padding(.top,20)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .background(
           LinearGradient(gradient: Gradient(colors: [AppColor.topGradientColor,
           AppColor.bottomGradientColor]), startPoint: .top, endPoint: .bottom)
        )
    }
}


