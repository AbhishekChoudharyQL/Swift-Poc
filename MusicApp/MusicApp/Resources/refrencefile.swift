//
//  refrencefile.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import Foundation

//HomeView()
//    .tabItem {
//        Label("Music", systemImage: "music.note")
//    }.tag(Tab.music)
//FavouriteView()
//    .tabItem {
//        Label("Favorites", systemImage: "heart")
//    }.tag(Tab.heart)
//SearchView()
//    .tabItem {
//        Label("Search", systemImage: "magnifyingglass")
//
//    }

//CustumtabItem

//struct CustomTabItem: View {
//    let tab: Tab
//    let itemAction : (() -> ())
//
//    var body: some View {
//        Button(action: {
//            itemAction()
//        }, label: {
//            Image(systemName: tab.rawValue)
//                .resizable()
//                .frame(width: 60, height: 60, alignment: .center)
//                .padding(.horizontal)
//        })
//        .tint(.white)
//    }
//}


//
//ZStack{
//    Image("marcela-laskoski-YrtFlrLo2DQ-unsplash")
//        .resizable()
//        .scaledToFill()
//        .ignoresSafeArea()
//        .opacity(0.7)
//    VStack(alignment: .leading,spacing: 40, content: {
//        AudioScreenButtons(buttonName: "heart")
//            .overlay(alignment: .topTrailing, content: {
//
//            })
//        AudioImageView()
//            .padding(.leading,30)
//            .padding(.trailing,30)
//
//        HStack(alignment: .center,spacing: 80, content: {
//            AudioScreenButtons(buttonName: "backward.circle.fill")
//            AudioScreenButtons(buttonName: "play.circle.fill")
//            AudioScreenButtons(buttonName: "forward.circle.fill")
//        })
//        SongDurationSlider()
//    })
//}.scaleEffect(scale)
//    .animation(.easeInOut(duration: 0.2))
//    .offset(x: offset.width, y: offset.height)
//    .gesture(DragGesture()
//                .onChanged { gesture in
//                    self.offset = gesture.translation
//                }
//                .onEnded { gesture in
//                    withAnimation {
//                        self.position.x += gesture.translation.width
//                        self.position.y += gesture.translation.height
//                        self.offset = .zero
//    }
//})
//    .gesture(MagnificationGesture()
//                            .onChanged { value in
//                                self.scale = value.magnitude
//                            }
//                            .onEnded { value in
//                                self.scale = 1.0
//                            })

//                NavigationStack{

//                } .navigationTitle("Search")
//                    .searchable(text: $searchText,prompt: "Artist,Songs,Playlists")

//TextField("Search", text: $searchText, onEditingChanged: { isEditing in
//    self.showCancelButton = true
//    // Handle editing changed event, if needed
//})
//.textFieldStyle(RoundedBorderTextFieldStyle())
//.foregroundColor(.pink)
//.padding(.horizontal)


//:- Setting up text to display song name in mini palyer..
//            Text("Song-Name")
//                .foregroundColor(Color.white)
//                .fontDesign(.serif)
//                .font(.custom("Helvitica", fixedSize: 25))
//                .fontWeight(.bold)
//                .multilineTextAlignment(.center)
//                .padding(.top)
//                .padding(.leading,15)
//            //:- Calling AudioScreenButtonsView to display buttons of mini player...
//               AudioScreenButtons(buttonName: "play.circle.fill")
//                .padding(.top)
//                .padding(.trailing)
//                AudioScreenButtons(buttonName: "forward.circle.fill")
//                .padding(.top)
//                .padding(.trailing,20)
