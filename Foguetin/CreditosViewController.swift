//
//  CreditosViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class CreditosViewController : UIViewController{
    
    let danca = [
                   UIImage(named: "17")!,
                   UIImage(named: "18")!,
                   UIImage(named: "19")!,
                   UIImage(named: "20")!,
                   UIImage(named: "21")!,
                   UIImage(named: "22")!,
                ]
    
    
    let creditosView = UIImageView(image: UIImage(named: "creditos"))
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)

        let animation = UIImage.animatedImage(with: danca, duration: 0.7)
        let imageView : UIImageView = UIImageView(image: animation)
        self.view.addSubview(imageView)
        
        self.view.addSubview(imageView)
        self.view.addSubview(creditosView)

        creditosView.contentMode = .scaleAspectFit
        creditosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            creditosView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            creditosView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
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

