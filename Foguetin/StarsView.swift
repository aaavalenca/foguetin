//
//  StarsView.swift
//  Foguetin
//
//  Created by aaav on 15/09/22.
//

import UIKit

class StarsView: UIView {

    var height = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func starAnimation(x: Int, y: Int, xm: Float, ym: Float, d: Double, s: Int) {
        let starImageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        starImageView.tintColor = .cyan
        starImageView.frame = CGRect(x: x, y: y, width: s, height: s)
        self.addSubview(starImageView)
        
        let starAnimation = CABasicAnimation(keyPath: "position")
        starAnimation.duration = d
        starAnimation.repeatCount = Float(x)
        starAnimation.autoreverses = true
        starAnimation.fromValue = NSValue(cgPoint: CGPoint(x: starImageView.center.x - CGFloat(xm), y: starImageView.center.y - CGFloat(ym)))
        starAnimation.toValue = NSValue(cgPoint: CGPoint(x: starImageView.center.x + CGFloat(xm), y: starImageView.center.y + CGFloat(ym)))
        starImageView.layer.add(starAnimation, forKey: "position")
    }
    
    func configure(width : Int, height : Int){
        var num = 100
        while (num > 0){
            let xr = Int.random(in: 0...height)
            let yr = Int.random(in: 0...width)
            let xm = Float.random(in: 0...10)
            let ym = Float.random(in: 0...10)
            let d = Double.random(in: 15...25)
            let size = Int.random(in: 7...12)
            print(xr)
            starAnimation(x: xr, y: yr, xm: xm, ym: ym, d: d, s: size)
            num = num - 1
        }
        
    }
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Stars: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            StarsView().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
