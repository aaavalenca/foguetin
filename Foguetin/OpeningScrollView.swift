//
//  OpeningScrollView.swift
//  Foguetin
//
//  Created by aaav on 16/09/22.
//

import UIKit

class OpeningScrollView: UIScrollView, UIScrollViewDelegate {
    
    let backgroundImage = UIImageView(image: UIImage(named: "abertura"))
        
    let jumpButton = UIButton(configuration: .filled())

    let foguetin = UIImageView(image: UIImage(named: "foguetin"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(jumpButton)
        backgroundImage.addSubview(foguetin)
    }
    
    func setupViewAttributes()
    {
        self.backgroundColor = .black
        jumpButton.tintColor = .red
        jumpButton.setTitle("PULAR", for: .normal)
        
        foguetin.frame = CGRect(x: backgroundImage.frame.midX - 30, y: 320, width: 57, height: 181)
    }
    
    func setupConstraints(){
        //MARK: - Chapada constraints
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        jumpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            jumpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            jumpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
            ])
        
        
    }
    
    func shipDeparture(){
        let shipAnimation = CABasicAnimation(keyPath: "position")
        shipAnimation.duration = 7
        shipAnimation.fromValue = NSValue(cgPoint: CGPoint(x: backgroundImage.frame.midX, y: backgroundImage.frame.maxY * 0.9))
        shipAnimation.toValue = NSValue(cgPoint:
                                            CGPoint(x: backgroundImage.frame.midX,
                    y: 400))
        foguetin.layer.add(shipAnimation, forKey: "position")
    }
    
    func setupAdditionalConfiguration(){
        
    }

    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_ScrollView: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            OpeningScrollView().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.portrait)
        }
    }
}
#endif
