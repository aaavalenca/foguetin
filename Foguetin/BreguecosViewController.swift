//
//  BreguecosViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//
import UIKit

class BreguecosViewController : UIViewController{
    let label = UILabel(frame: CGRect(x: 50, y:100, width: 200, height: 20))
    let cockpitTop = UIImageView(image: UIImage(named: "bregueco-cockpit-top"))
    let cockpitBottom = UIImageView(image: UIImage(named: "bregueco-cockpit-bottom"))
    let cockpitTopContainer = UIView()
    let collectionViewBreguecos = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        
        label.text = "BREGUECOS"
        label.textColor = .white
    }
    
    func setupViewsHierarchy() {
        view.addSubview(cockpitTop)
        view.addSubview(cockpitBottom)
        view.addSubview(cockpitTopContainer)
        view.addSubview(collectionViewBreguecos)
        
        cockpitTopContainer.addSubview(cockpitTop)
        cockpitTopContainer.addSubview(label)
        
    }
    
    func setupViewsAttributes() {
        cockpitTop.contentMode = .scaleAspectFill
        cockpitBottom.contentMode = .scaleToFill
        
        collectionViewBreguecos.delegate = self
        collectionViewBreguecos.dataSource = self
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: 100, height: 121)
        layout.minimumInteritemSpacing = 10
        
        collectionViewBreguecos.collectionViewLayout = layout
        collectionViewBreguecos.backgroundColor = .clear
        collectionViewBreguecos.register(BreguecosCollectionViewCell.self, forCellWithReuseIdentifier: BreguecosCollectionViewCell.identifier)
    }
    
    func setupConstraints() {
        cockpitTopContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpitTop.topAnchor.constraint(equalTo: view.topAnchor),
            cockpitTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cockpitTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cockpitTop.heightAnchor.constraint(equalToConstant: 183)
        ])
        
        cockpitTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpitTop.topAnchor.constraint(equalTo: cockpitTopContainer.topAnchor),
            cockpitTop.trailingAnchor.constraint(equalTo: cockpitTopContainer.trailingAnchor),
            cockpitTop.leadingAnchor.constraint(equalTo: cockpitTopContainer.leadingAnchor),
            cockpitTop.bottomAnchor.constraint(equalTo: cockpitTopContainer.bottomAnchor)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cockpitTopContainer.centerXAnchor),
            label.topAnchor.constraint(equalTo: cockpitTopContainer.topAnchor, constant: 122),
        ])
        
        collectionViewBreguecos.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewBreguecos.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionViewBreguecos.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionViewBreguecos.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60),
            collectionViewBreguecos.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60)
        ])
        
        cockpitBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpitBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cockpitBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cockpitBottom.heightAnchor.constraint(equalToConstant: 60),
            cockpitBottom.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BreguecosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreguecosCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Breguecos: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            BreguecosViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.portraitUpsideDown)
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
