//
//  EditFoodView.swift
//  CaloriesCoreData
//
//  Created by abhishek on 26/04/23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var calories : Double = 0.0
    var food : FetchedResults<Food>.Element
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name ?? "No-food"
                        calories = food.calories
                    }
                VStack(content: {
                    Text("Calories : \(Int(calories))")
                    Slider(value: $calories,in: 0...1000,step: 10)
                }).padding()
                HStack(content: {
                    Spacer()
                    Button("Submit", action: {
                        DataController().editFood(food: food, name: name, calories: calories, context: managedContext)
                        dismiss()
                    })
                    Spacer()
                })
            }
        }
    }
}

