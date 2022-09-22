//
//  WinView.swift
//  Foguetin
//
//  Created by aaav on 22/09/22.
//

import UIKit

class WinView: UIView {

    let danca = [UIImage(named: "d1")!,
                   UIImage(named: "d2")!,
                   UIImage(named: "d3")!,
                   UIImage(named: "d4")!,
                   UIImage(named: "d5")!,
                   UIImage(named: "d6")!
                ]
    
    let stackView = UIStackView()

    let desistir = WinLoseButton()
    let vinganca = WinLoseButton()
    let pegar = WinLoseButton()
    
    weak var delegate: WinViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .purple
        setViewsHierarchy()
        setViewsAttributes()
        setConstraints()
        setupAdditionalConfiguration()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setViewsHierarchy(){
        let animation = UIImage.animatedImage(with: danca, duration: 0.7)
        let imageView : UIImageView = UIImageView(image: animation)
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        
        self.addSubview(pegar)

    }
    func setViewsAttributes(){
        pegar.setPegar()
        
    }
    func setConstraints(){
        pegar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pegar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pegar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
    
    func setupAdditionalConfiguration(){
        pegar.addTarget(self, action: #selector(recompensa), for: .touchUpInside)
    }

    
    @objc func recompensa(sender: UIButton) {
        delegate?.goBreguecos()
        delegate?.resetStoryView()
    }
    
    


}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Win: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            WinView().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
