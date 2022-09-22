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

    @objc let desistir = WinLoseButton()
    let vinganca = WinLoseButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .purple
        setViewsHierarchy()
        setViewsAttributes()
        setConstraints()
        setupAdditionalConfiguration()

    }
    
    func setViewsHierarchy(){
        let animation = UIImage.animatedImage(with: danca, duration: 0.3)
        let imageView : UIImageView = UIImageView(image: animation)
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        
        self.addSubview(stackView)
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
    }
    
    func setupAdditionalConfiguration(){
        vinganca.addTarget(self, action: #selector(voltarJogo), for: .touchUpInside)
        desistir.addTarget(self, action: #selector(voltarNave), for: .touchUpInside)
    }

    @objc func voltarNave(sender: UIButton) {
        self.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func voltarJogo(sender: UIButton) {
        
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
