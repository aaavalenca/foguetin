//
//  StoryViewController.swift
//  Foguetin
//
//  Created by aaav on 15/09/22.
//

import UIKit

class StoryViewController: UIViewController {
    
    var numStory = 0
    let stars = StarsView()
    let dogView = UIImageView(image: UIImage(named: "cachorra"))
    let balao = UIImageView(image: UIImage(named: "balao"))
    var story = UILabel()
    let voltar = UIButton(configuration: .filled())
    let continuar = UIButton(configuration: .filled())
    let stackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)
  
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        let dogAnimation = CABasicAnimation(keyPath: "position")
        dogAnimation.duration = 2
        dogAnimation.repeatCount = 1000
        dogAnimation.autoreverses = true
        dogAnimation.fromValue = NSValue(cgPoint: CGPoint(x: dogView.center.x, y: dogView.center.y - 20))
        dogAnimation.toValue = NSValue(cgPoint: CGPoint(x: dogView.center.x, y: dogView.center.y + 20))
        dogView.layer.add(dogAnimation, forKey: "position")
    }
    
    
    func setupViewHierarchy(){
        self.view.addSubview(stars)
        stars.configure(width: Int(self.view.bounds.maxY), height: Int(self.view.bounds.maxX))
        self.view.addSubview(balao)
        self.view.addSubview(dogView)
        dogView.frame = CGRect(x: 0, y: 0, width: 192, height: 403)
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(voltar)
        stackView.addArrangedSubview(continuar)
    }
    
    func setupViewAttributes(){
        balao.contentMode = .scaleAspectFit
        voltar.setTitle("VOLTAR", for: .normal)
        continuar.setTitle("CONTINUAR", for: .normal)
        stackView.spacing = 30
    }
    
    func setupConstraints(){
        balao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balao.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            balao.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            balao.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            balao.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
        
        dogView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dogView.topAnchor.constraint(equalTo: balao.bottomAnchor, constant: -100),
            dogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
        
    }
    
    func setStory(numStory : Int){
        if (numStory == 1){
            self.story.text = "Eis a história 1"
        } else if (numStory == 2){
            self.story.text = "A história número 2 começa aqui"
        } else {
            self.story.text = "Essa é a história 3"
        }
    }    
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Story: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            StoryViewController().showPreview().previewDevice("iPhone 11")
        }
    }
}
#endif
