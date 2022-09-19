//
//  OpeningScrollView.swift
//  Foguetin
//
//  Created by aaav on 16/09/22.
//

import UIKit

class OpeningScrollView: UIScrollView {
    
    let backgroundImage = UIImageView(image: UIImage(named: "abertura"))
        
    let jumpButton = UIButton(configuration: .filled())

    let readyButton = UIButton(configuration: .filled())
    
    let foguetin = UIImageView(image: UIImage(named: "foguetin"))
    let up = UIImageView(image: UIImage(systemName: "hand.point.up.fill"))

    let tabBarVC = MainTabBarController()

    var bottomScreen = 0.0
    
    weak var myDelegate : OpeningScrollViewDelegate?
    override weak var delegate: UIScrollViewDelegate? {
        didSet{
            myDelegate = delegate as? OpeningScrollViewDelegate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
//        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        self.addSubview(backgroundImage)
        self.addSubview(jumpButton)
        self.addSubview(readyButton)
        backgroundImage.addSubview(foguetin)
        backgroundImage.addSubview(up)

    }
    
    func setupViewAttributes()
    {
        
        jumpButton.tintColor = .red
        jumpButton.setTitle("PULAR\nAPRESENTAÇÃO", for: .normal)
        jumpButton.titleLabel?.textAlignment = .center
        
        readyButton.tintColor = .blue
        readyButton.setTitle("PREPARAR", for: .normal)
        
        foguetin.frame = CGRect(x: backgroundImage.frame.midX - 30, y: 320, width: 57, height: 181)
        
        up.tintColor = .yellow
        up.frame = CGRect(x: backgroundImage.frame.maxX - 70, y: backgroundImage.frame.maxY - 600, width: 60, height: 70)
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
            jumpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -190)
            ])
        
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            readyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: bottomScreen - 150)
            ])
//        backgroundImage.contentMode = .scaleAspectFit
    }
    
    func setBottomScreen(width: Double, height : Double){
        bottomScreen = height
        setupConstraints()
    }
    
    func shipDeparture(){
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 14
        
        let shipStopped = CABasicAnimation(keyPath: "position")
        shipStopped.duration = 4
        shipStopped.fromValue = NSValue(cgPoint: CGPoint(x: backgroundImage.frame.midX, y: backgroundImage.frame.maxY * 0.9))
        shipStopped.toValue = NSValue(cgPoint: CGPoint(x: backgroundImage.frame.midX, y: backgroundImage.frame.maxY * 0.9))
                
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.duration = 2
        rotate.fromValue = .pi/1.0
        rotate.toValue = 0.0
        
        let shipAnimation = CABasicAnimation(keyPath: "position")
        shipAnimation.beginTime = shipStopped.beginTime + shipStopped.duration
        shipAnimation.duration = 7
        shipAnimation.fromValue = NSValue(cgPoint: CGPoint(x: backgroundImage.frame.midX, y: backgroundImage.frame.maxY * 0.9))
        shipAnimation.toValue = NSValue(cgPoint:
                                            CGPoint(x: backgroundImage.frame.midX,
                    y: 400))
        
        groupAnimation.animations = [shipStopped, rotate, shipAnimation]
        foguetin.layer.add(groupAnimation, forKey: nil)
        
        
        let handAnimation = CABasicAnimation(keyPath: "position")
        handAnimation.duration = 0.5
        handAnimation.repeatCount = 1000
        handAnimation.autoreverses = true
        handAnimation.fromValue = NSValue(cgPoint: CGPoint(x: up.center.x, y: up.center.y - 10))
        handAnimation.toValue = NSValue(cgPoint: CGPoint(x: up.center.x, y: up.center.y + 10))
        up.layer.add(handAnimation, forKey: "position")
        
    }
    
    func setupAdditionalConfiguration() {
        jumpButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        readyButton.addTarget(self, action: #selector(tappedButton2), for: .touchUpInside)
    }
    
    @objc func tappedButton(sendeR: UIButton){
        myDelegate?.goToShip()
    }
    
    @objc func tappedButton2(sendeR: UIButton){
        myDelegate?.getReady()
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
