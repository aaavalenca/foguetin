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
    
    let planets = [UIImage(),
                   UIImage(named: "planeta1"),
                   UIImage(named: "planeta2"),
                   UIImage(named: "planeta3"),
                   UIImage()
                   ]
    
    let infoPlanets = [UIImage(named: "infoplaneta0"),
                       UIImage(named: "infoplaneta1"),
                       UIImage(named: "infoplaneta2"),
                       UIImage(named: "infoplaneta3"),
                       UIImage(named: "infoplaneta3")
                       ]
    
    let stars = StarsView()
    
    let screenContainerView = UIView()
    
    let infoView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupViewHierarchy(){
        self.view.addSubview(stars)
        stars.configure(width: Int(view.bounds.maxX), height: Int(view.bounds.maxY))
        
        self.view.addSubview(containerView)
        containerView.addSubview(collectionView)
        
        self.view.addSubview(cockpit)
        cockpit.addSubview(screenContainerView)
        
        screenContainerView.addSubview(infoView)
        
    }
    
    func setupViewAttributes(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        collectionView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0)

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumLineSpacing = 100
        collectionView.collectionViewLayout = layout
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)
        
        cockpit.image = UIImage(named: "cockpit2 1")
        cockpit.contentMode = .scaleAspectFit
        
//        containerView.backgroundColor = .cyan
        
//        screenContainerView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3)
        
        infoView.image = infoPlanets[0]
        infoView.contentMode = .scaleAspectFit
        
    }
    
    
    func setupConstraints(){
        
        // Cockpit constraint
        cockpit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpit.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60),
            cockpit.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            cockpit.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        // Hacking constraint to center
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cockpit.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 200),
            containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: -200)
        ])
        
        
        // Planets constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        
        // Screen container view
        screenContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screenContainerView.topAnchor.constraint(equalTo: cockpit.topAnchor),
            screenContainerView.heightAnchor.constraint(equalTo: cockpit.heightAnchor, multiplier: 0.5),
            screenContainerView.widthAnchor.constraint(equalTo: cockpit.widthAnchor)
        ])
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: screenContainerView.topAnchor),
            infoView.bottomAnchor.constraint(equalTo: screenContainerView.bottomAnchor),
            infoView.centerXAnchor.constraint(equalTo: screenContainerView.centerXAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration(){
        
    }

}

extension NaveViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.identifier, for: indexPath) as! PlanetCollectionViewCell
        cell.configure(planet: planets[indexPath.row] ?? UIImage())
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
          if let row = collectionView.indexPath(for: cell)?.item {
              infoView.image = infoPlanets[row]
              print(row)
          }
        }
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
            NaveViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
#endif
