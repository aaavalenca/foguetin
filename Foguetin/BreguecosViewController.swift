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
    
    lazy var viewpopUpWindo: PopUpWindoW = {
        let view = PopUpWindoW()
        view.layer.cornerRadius = 5.0
        view.delegate = self
        return view
    }()
    
    let visualEffetctView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
        
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        
        
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
        label.text = "BREGUECOS"
        label.textColor = .white
        
        cockpitTop.contentMode = .scaleToFill
        cockpitBottom.contentMode = .scaleToFill
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 121)
        layout.minimumInteritemSpacing = 10
        collectionViewBreguecos.delegate = self
        collectionViewBreguecos.dataSource = self
        collectionViewBreguecos.collectionViewLayout = layout
        collectionViewBreguecos.backgroundColor = .clear
        collectionViewBreguecos.register(BreguecosCollectionViewCell.self, forCellWithReuseIdentifier: BreguecosCollectionViewCell.identifier)
        
        
        visualEffetctView.alpha = 0.9
        
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
            collectionViewBreguecos.topAnchor.constraint(equalTo: cockpitTopContainer.bottomAnchor, constant: 30),
            collectionViewBreguecos.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80),
            collectionViewBreguecos.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            collectionViewBreguecos.bottomAnchor.constraint(equalTo: cockpitBottom.topAnchor)
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreguecosCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.addSubview(visualEffetctView)
        view.addSubview(viewpopUpWindo)
        
        viewpopUpWindo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewpopUpWindo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewpopUpWindo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewpopUpWindo.heightAnchor.constraint(equalToConstant: view.frame.width - 64),
            viewpopUpWindo.widthAnchor.constraint(equalToConstant: view.frame.width - 64)
        ])
        
        visualEffetctView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visualEffetctView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffetctView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffetctView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffetctView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        viewpopUpWindo.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        viewpopUpWindo.alpha = 0.9
        
        UIView.animate(withDuration: 0.4){
            self.visualEffetctView.alpha = 0.9
            self.viewpopUpWindo.alpha = 0.9
            self.viewpopUpWindo.transform = CGAffineTransform.identity
        }
        
    }
}

extension BreguecosViewController: PopUpDelegate {
    func handleDismissal() {
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffetctView.alpha = 0
            self.viewpopUpWindo.alpha = 0
            self.viewpopUpWindo.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.viewpopUpWindo.removeFromSuperview()
        }
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
