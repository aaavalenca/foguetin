//
//  StartView.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class StartView : UIView {
    
    let startButton = UIButton(configuration: .filled())
    let tabVC = MainTabBarController()
    
    weak var delegate : StartViewDelegate?
        
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
        self.addSubview(startButton)
    }
    
    func setupViewAttributes(){
        self.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        startButton.setTitle("VAMOS LÁ!", for: .normal)
    }
    
    func setupConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

//            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        startButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton(sendeR: UIButton){
        delegate?.goToShip()
    }
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview_Start: PreviewProvider {
    static var previews: some View {
        Group {
            StartView().showPreview().previewDevice("iPhone 11")
//            DicesView().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
