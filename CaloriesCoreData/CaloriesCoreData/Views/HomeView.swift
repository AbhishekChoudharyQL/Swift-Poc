//
//  ContentView.swift
//  CaloriesCoreData
//
//  Created by abhishek on 26/04/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) var objContext
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date,
        order: .reverse)])
    var food: FetchedResults<Food>
    @State private var showingAddView = false
    
    //MARK: - View Builder
    var body: some View {
    NavigationView(content: {
        VStack(alignment: .leading,content: {
            Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                .foregroundColor(.gray)
                .padding()
            List {
            ForEach(food) {
                food in
                NavigationLink(destination: EditFoodView(food: food)) {
                    HStack(content: {
                        VStack(alignment: .leading,spacing:6,content: {
                            if let foodName = food.name {
                                Text(foodName)
                                    .bold()
                            }
                            Text("\(food.calories)")
                            Text("Calories").foregroundColor(.red)
                            })
                          Spacer()
                        Text(calculateTime(date:food.date!))
                        })
                    .foregroundColor(.gray)
                    .italic()
                    }
            }.onDelete(perform: deleteFood)
            }.listStyle(.plain)
        })
        .navigationTitle("iCalories")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }.sheet(isPresented: $showingAddView){
            AddFoodView()
        }
    }).navigationViewStyle(.stack)
 }
    private func deleteFood(offset: IndexSet){
        withAnimation {
            offset.map{food[$0]}.forEach(objContext.delete)
            DataController().save(context: objContext)
        }
    }
    private func totalCaloriesToday() -> Double {
        var caloriesToday = 0.0
        for item in food {
            if Calendar.current.isDateInToday(item.date!){
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
}

 //MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
