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

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumLineSpacing = 100
        collectionView.collectionViewLayout = layout
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)

        
        cockpit.image = UIImage(named: "cockpit2 1")
        cockpit.contentMode = .scaleAspectFit
        
        collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        infoView.image = infoPlanets[0]
        infoView.contentMode = .scaleAspectFit
        
    }
    
    
    func setupConstraints(){
        
        // Cockpit constraint
        cockpit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cockpit.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            cockpit.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            cockpit.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            cockpit.heightAnchor.constraint(equalTo: cockpit.widthAnchor, multiplier: 1.11)
        ])
        
        // Hacking constraint to center
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cockpit.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        
        cockpit.setContentHuggingPriority(.defaultLow, for: .vertical)
        containerView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        // Planets constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
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
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        
        let i : Int = visibleIndexPath?[1] ?? 0

        infoView.image = infoPlanets[i]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        
        if (indexPath[1] == 1){
            print("Vai para o planeta Kaô")
        }
        if (indexPath[1] == 2){
            print("Vai para o planeta Zoé")
        }
        if (indexPath[1] == 3){
            print("Vai para o planeta Betesga")
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
