//
//  StoryViewController.swift
//  Foguetin
//
//  Created by aaav on 15/09/22.
//

import UIKit

class StoryViewController: UIViewController {

    let storyView = StoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setStory(numStory : Int){
        if (numStory == 1) {
            
        } else if (numStory == 2){
            
        } else {
            
        }
    }    
    
}



// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Story: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            StoryViewController().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
