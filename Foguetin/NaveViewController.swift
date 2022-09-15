//
//  NaveViewController.swift
//  Foguetin
//
//  Created by aaav on 12/09/22.
//

import UIKit

class NaveViewController : UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let cockpit = UIImageView()
    
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupViewHierarchy(){
        self.view.addSubview(containerView)
        self.view.addSubview(collectionView)
        self.view.addSubview(cockpit)
    }
    
    func setupViewAttributes(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        collectionView.collectionViewLayout = layout
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)
        
        cockpit.image = UIImage(named: "cockpit2 1")
        cockpit.contentMode = .scaleAspectFit
        
//        containerView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3)
    }
    
    
    func setupConstraints(){
        
        // Hacking constraint to center
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cockpit.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        // Planets constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        // Cockpit constraint
        cockpit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpit.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60),
            cockpit.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            cockpit.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    func setupAdditionalConfiguration(){
        
    }

}

extension NaveViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
}



// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Nave: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            NaveViewController().showPreview().previewDevice("iPhone 11")
        }
    }
}
#endif
