//
//  OnboardingViewModel.swift
//  MusicApp
//
//  Created by Manish Solanki on 11/04/23.
//

import Foundation
import UIKit

class OnboardingViewModel : ObservableObject {
    // MARK: - Published properties
    @Published var pageIndex = 0
    
    //MARK: - Stored Properties
    var pages : [Page] = Page.samplePages
    let dotApppearence = UIPageControl.appearance()
    
    
}
