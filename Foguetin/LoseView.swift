//
//  WinView.swift
//  Foguetin
//
//  Created by aaav on 22/09/22.
//

import UIKit

class LoseView: UIView {

    let danca = [UIImage(named: "f1")!,
                   UIImage(named: "f2")!,
                   UIImage(named: "f3")!
                ]
    
    let stackView = UIStackView()

    let desistir = WinLoseButton()
    let vinganca = WinLoseButton()
    let pegar = WinLoseButton()
    
    let ground = UIImageView(image: UIImage(named: "chao2"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        setViewsHierarchy()
        setViewsAttributes()
        setConstraints()
        setupAdditionalConfiguration()

    }
    
    func setViewsHierarchy(){
        self.addSubview(ground)

        let animation = UIImage.animatedImage(with: danca, duration: 0.3)
        let imageView : UIImageView = UIImageView(image: animation)
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        
        self.addSubview(stackView)
        self.addSubview(pegar)
        stackView.addArrangedSubview(desistir)
        stackView.addArrangedSubview(vinganca)

    }
    func setViewsAttributes(){
        stackView.spacing = 30
        stackView.distribution = .fillProportionally

        desistir.setDesistir()
        vinganca.setVinganca()
        
    }
    func setConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        ground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ground.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            ground.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            ground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration(){
        
    }

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Lose: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            LoseView().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
