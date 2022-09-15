//
//  PlanetCollectionViewCell.swift
//  Foguetin
//
//  Created by aaav on 14/09/22.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlanetCollectionViewCell"
    let imageView = UIImageView()
    
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
        self.addSubview(imageView)
    }
    
    func setupViewAttributes(){
        imageView.image = UIImage(named: "planeta1")
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupAdditionalConfiguration(){
        
    }
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Planet: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            PlanetCollectionViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 200, height: 200))
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

