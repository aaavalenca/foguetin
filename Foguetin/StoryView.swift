//
//  StoryView.swift
//  Foguetin
//
//  Created by aaav on 15/09/22.
//

import UIKit

class StoryView : UIView {
    
    let cachorra = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cachorra.image = UIImage(named: "cachorra")
        
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        self.addSubview(cachorra)
    }
    
    func setupViewAttributes(){
        self.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
    }
    
    func setupConstraints(){
        
//         Cachorra constraint
        cachorra.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cachorra.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            cachorra.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cachorra.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cachorra.bottomAnchor.constraint(equalTo: self.topAnchor)
        ])
        
    }
    
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_StoryView: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            StoryView().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
