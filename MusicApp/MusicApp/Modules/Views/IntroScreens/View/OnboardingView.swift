//
//  IntroScreensView.swift
//  OnboardingView
//
//  Created by abhishek on 07/04/23.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    @Binding var userSession : UserSession
    @State var pageIndex = 0
    var pages : [Page] = Page.samplePages
    let dotApppearence = UIPageControl.appearance()
    
    //MARK: - View Builder
    var body: some View {
        TabView(selection: $pageIndex, content: {
            ForEach(pages) { page in
                VStack(content: {
                    PageView(page: page)
                    if page == pages.last {
                        Button( action: {
                            self.userSession = .userOnMainApp
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
    
    //MARK: - Private Methods
    private func incrementPage() {
           pageIndex += 1
       }
       
    private func goToZero() {
           pageIndex = 0
       }
}

  //MARK: - Previews
struct IntroScreensView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(userSession: .constant(.userOnIntroScreen))
    }
}
