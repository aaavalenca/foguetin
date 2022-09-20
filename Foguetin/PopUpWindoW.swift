import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

class PopUpWindoW: UICollectionViewCell {
    var delegate: PopUpDelegate?
    
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        backgroundColor = .white
        
    }
    
    func setupViewsHierarchy() {
        addSubview(button)
    }
    
    func setupViewsAttributes() {
        button.backgroundColor = .blue
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.layer.cornerRadius = 5.0
    }
    
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 270),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
