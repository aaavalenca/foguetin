//
//  BreguecosViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit


class BreguecosViewController : UIViewController{
    
    let kaoMedal = UserDefaults.standard
    let zoeMedal = UserDefaults.standard
    let betesgaMedal = UserDefaults.standard
    
    let label = UILabel(frame: CGRect(x: 50, y:100, width: 200, height: 20))

    
    override func viewDidLoad() {

        kaoMedal.set(false, forKey: "kao")
        zoeMedal.set(false, forKey: "zoe")
        betesgaMedal.set(false, forKey: "betesga")

//        to retrieve information
        kaoMedal.bool(forKey: "kao")
        
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        //só para marcar
        view.addSubview(label)
        label.text = "BREGUECOS"
        label.textColor = .white
        
    }
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Breguecos: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            BreguecosViewController().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
