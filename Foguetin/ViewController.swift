//
//  ViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let tabBarVC = MainTabBarController()
    let opening = OpeningScrollView()
    var width = 0.0
    var height = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.frame.size.width
        height = self.view.frame.size.height
        self.view = opening
        opening.delegate = self
        setupViewAttributes()

    }
    
    func setupViewAttributes(){
        //MARK: - ScrollView
        opening.contentSize = CGSize(width: width, height: (width * 11.35))
        let bottomOffset = CGPoint(x: 0, y: opening.contentSize.height)
        opening.setContentOffset(bottomOffset, animated: true)
        opening.setBottomScreen(width: width, height: height)
        opening.shipDeparture()

    }
    
    override func viewDidLayoutSubviews() {
    }

    
}

extension ViewController: OpeningScrollViewDelegate, sendTabBarInfo {
    
    func pass() {
        tabBarVC.selectedIndex = 0
    }
    
    func goToShip() {
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.selectedIndex = 1
        present(tabBarVC, animated: true)
    }
    func getReady() {
        print("Onboarding")
    }

}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ViewController().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
