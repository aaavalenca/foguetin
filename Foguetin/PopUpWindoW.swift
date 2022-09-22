import UIKit
import SwiftUI

protocol PopUpDelegate {
    func handleDismissal()
}

class PopUpWindoW: UICollectionViewCell {
    var delegate: PopUpDelegate?
    let view = UIView()
    let button = UIButton()
    let frameTop = UIImageView(image: UIImage(named: "frameTop"))
    let frameBottom = UIImageView(image: UIImage(named: "frameBottom"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        backgroundColor = .black
    }
    
    func setupViewsHierarchy() {
        addSubview(frameTop)
        addSubview(frameBottom)
        addSubview(button)
    }
    
    func setupViewsAttributes() {
        button.backgroundColor = UIColor(red: 147/255, green: 21/255, blue: 36/255, alpha: 1)
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 79/255, green: 69/255, blue: 69/255, alpha: 1).cgColor
    }
    
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 37),
            button.widthAnchor.constraint(equalToConstant: 37)
        ])
        
        frameTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frameTop.topAnchor.constraint(equalTo: topAnchor, constant: -25),
            frameTop.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        frameBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frameBottom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 25),
            frameBottom.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
