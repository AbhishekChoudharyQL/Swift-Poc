//
//  AddFoodView.swift
//  CaloriesCoreData
//
//  Created by abhishek on 26/04/23.
//

import SwiftUI

struct AddFoodView: View {
    
    //MARK: - Properties
//    @Environment(\.managedObjectContext) var managedContext
//    @Environment(\.dismiss) var dismiss
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            AddFoodSubView()
        })
      
    }
}

    //MARK: - Previews
struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
























//struct AddFoodSubView: View {
//    @Environment(\.managedObjectContext) var managedContext
//    @State private var name = ""
//    @State private var calories : Double = 0
//    var body: some View {
//        Form{
//            Section{
//                TextField("Foodname",text: $name)
//                VStack(content: {
//                    Text("Calories: \(Int(calories))")
//                        .foregroundColor(.cyan)
//                    Slider(value: $calories,in: 0...1000 , step: 10)
//                        .accentColor(.cyan)
//                }).padding()
//                HStack(content: {
//                    Spacer()
//                    Button("Submit", action: {
//                        DataController().addFood(name: name, calories: calories, context: managedContext)
//                    })
//                    .foregroundColor(.cyan)
//                    Spacer()
//                })
//            }
//        }
//    }
//}
