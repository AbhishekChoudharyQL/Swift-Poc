//
//  IntroScreensView.swift
//  MusicApp
//
//  Created by abhishek on 07/04/23.
//

import SwiftUI

struct IntroScreensViews: View {
    @State private var pageIndex = 0
    private var pages : [Page] = Page.samplePages
    private let dotApppearence = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex, content: {
            ForEach(pages) { page in
                VStack(content: {
                    PageView(page: page)
                    if page == pages.last {
                        Button( action: {
                            TabBarManager()
                        }, label: {
                            Text("Get Started")
                        }
                       ).buttonStyle(.borderedProminent)
                          .buttonStyle(.bordered)
                } else {
                    Button("Next", action: incrementPage)
                        .buttonStyle(.borderedProminent)
                        .padding(.bottom,40)
                }
                
                }) .tag(page.tag)
            }
        }).frame(height: UIScreen.main.bounds.height)
            .padding(.bottom,30)
        .animation(.easeInOut, value: pageIndex)// 2
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                dotApppearence.currentPageIndicatorTintColor = .black
                dotApppearence.pageIndicatorTintColor = .gray

            }
    }
    func incrementPage() {
           pageIndex += 1
       }
       
       func goToZero() {
           pageIndex = 0
       }
}

struct IntroScreensView_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreensViews()
    }
}
