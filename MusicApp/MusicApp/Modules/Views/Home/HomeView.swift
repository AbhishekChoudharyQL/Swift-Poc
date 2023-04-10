//
//  HomeView.swift
//  MusicApp
//
//  Created by abhishek on 03/04/23.
//

import SwiftUI

//artist json = "https://api.jsonserve.com/A5rmJ5"
struct HomeView: View {
    //MARK: - Properties
    @EnvironmentObject var artist : Networking
    @State var isAnimating = false
    //MARK: - View Builder
    var body: some View {
        ZStack {
            //: - Setting up background images for home screen inside Zstack..
            Image("musichome")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
//                .scaleEffect(isAnimating ? 1.0 : 0.94)
                .opacity(isAnimating ? 1.0 : 0.4)
            //: - Parent Vstack to hold title, artists-scrollView, playlist-scrollView
                 VStack {
                //: - Setting up title for home screen..
                Text("onbeats Music")
                .foregroundColor(.white)
                .font(.custom("Georgia", size: 45, relativeTo: .headline))
                .bold()
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,20)
                Spacer()
                //: Vstack to display "Recommended Artist Title" and scrollview of artists
                VStack( alignment: .center ,content: {
                    Text("Recommended Artist")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .bold()
                    ScrollView(.horizontal) {
                        HStack(alignment: .center,spacing: 0 , content: {
                            ForEach(0..<8){ index in
                                VStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.white)
                                        .frame(width: 200 , height: 150)
                                        .shadow(color: .pink, radius: 10 )
                                        .padding()
                                    Text("Artist-Name")
                                        .foregroundColor(.white)
                                }
                            }
                        })
                    }//: - Scroll View for artists ends here...
                })
                  
//                    Spacer()
//                    .padding()
                VStack(alignment: .leading, content: {
                    ScrollView{
                        ForEach(0..<8){
                            index in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white)
                                .frame(width: 200 , height: 150)
                                .shadow(color: .pink, radius: 10 )
                                .padding()
                            Text("Artist-Name")
                                .foregroundColor(.white)                             
                        }
                        
                    }
                })
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1.5)){
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Networking())
    }
}
