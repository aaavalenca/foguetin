//
//  ViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class ViewController: UIViewController {

    let startView = StartView()
    let tabBarVC = MainTabBarController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = startView
        startView.delegate = self
    }
}

extension ViewController: StartViewDelegate{
    func goToShip() {
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
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
