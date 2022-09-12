//
//  CreditosViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class CreditosViewController : UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        //só para marcar
        let label = UILabel(frame: CGRect(x: 50, y:100, width: 200, height: 20))
        view.addSubview(label)
        label.text = "CREDITOS"
        label.textColor = .white
        
    }
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Creditos: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            CreditosViewController().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

