//
//  BreguecosCollectionViewCell.swift
//  Foguetin
//
//  Created by ggs on 14/09/22.
//

import UIKit

class BreguecosCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    static let identifier = "BreguecosViewController"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewsHierarchy (){
        self.addSubview(imageView)
    }
    
    func setupViewsAttributes (){
        imageView.image = UIImage(named: "cadeadoAmarelo")
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupConstraints (){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct BreguecosCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            BreguecosCollectionViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 100, height: 121))
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
