//
//  CreditosViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class CreditosViewController : UIViewController{
    fileprivate func starAnimation(x: Int, y: Int, xm: Float, ym: Float, d: Double, s: Int) {
        let starImageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        starImageView.tintColor = .cyan
        starImageView.frame = CGRect(x: x, y: y, width: s, height: s)
        view.addSubview(starImageView)
        let starAnimation = CABasicAnimation(keyPath: "position")
        starAnimation.duration = d
        starAnimation.repeatCount = Float(x)
        starAnimation.autoreverses = true
        starAnimation.fromValue = NSValue(cgPoint: CGPoint(x: starImageView.center.x - CGFloat(xm), y: starImageView.center.y - CGFloat(ym)))
        starAnimation.toValue = NSValue(cgPoint: CGPoint(x: starImageView.center.x + CGFloat(xm), y: starImageView.center.y + CGFloat(ym)))
        starImageView.layer.add(starAnimation, forKey: "position")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        //só para marcar
        let label = UILabel(frame: CGRect(x: 50, y:100, width: 200, height: 20))
        view.addSubview(label)
        label.text = "CREDITOS"
        label.textColor = .white
    
        var num = 100
        
        while (num > 0){
            let xr = Int.random(in: 0...Int(view.frame.maxX))
            let yr = Int.random(in: 0...Int(view.frame.maxY))
            let xm = Float.random(in: 0...10)
            let ym = Float.random(in: 0...10)
            let d = Double.random(in: 15...25)
            let size = Int.random(in: 7...12)
            starAnimation(x: xr, y: yr, xm: xm, ym: ym, d: d, s: size)
            num = num - 1
        }
        
        
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

