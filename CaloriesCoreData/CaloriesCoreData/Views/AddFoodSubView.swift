//
//  AddFoodSubView.swift
//  CaloriesCoreData
//
//  Created by abhishek on 26/04/23.
//

import SwiftUI

struct AddFoodSubView: View {
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var calories : Double = 0
    
    //MARK: - View Builder
    var body: some View {
        Form{
            Section{
                TextField("Foodname",text: $name)
                VStack(content: {
                    Text("Calories: \(Int(calories))")
                        .foregroundColor(.cyan)
                    Slider(value: $calories,in: 0...1000 , step: 10)
                        .accentColor(.cyan)
                }).padding()
                HStack(content: {
                    Spacer()
                    Button("Submit", action: {
                        DataController().addFood(name: name, calories: calories, context: managedContext)
                        dismiss()
                    })
                    .foregroundColor(.cyan)
                    Spacer()
                })
            }
        }
    }
}

//MARK: - Previews
struct AddFoodSubView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodSubView()
    }
}
