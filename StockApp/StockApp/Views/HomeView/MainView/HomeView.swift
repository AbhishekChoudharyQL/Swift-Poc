//
//  ContentView.swift
//  StockApp
//
//  Created by abhishek on 27/04/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @State var selectedTab : TabItems = .stocks
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - View Builder
    var body: some View {
        ZStack(content: {
            launchScreenState.state == .finished ? AnyView(TabBarManager(selectedTab: selectedTab)) : AnyView(LaunchScreenView())
        }).task {
                try? await getDataFromApi()
                try? await Task.sleep(for: Duration.seconds(1))
                self.launchScreenState.dismiss()
        }
    }
    
    //MARK: - Private Methods
    fileprivate func getDataFromApi() async throws {
        guard let googleURL = URL(string: "https://www.google.com") else{return}
        let (_,response) = try await URLSession.shared.data(from: googleURL)
        print(response as? HTTPURLResponse as Any)
    }
}


 // MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LaunchScreenStateManager())
    }
}

