//
//  StoryViewController.swift
//  Foguetin
//
//  Created by aaav on 15/09/22.
//

import UIKit
import SpriteKit

protocol SecondViewControllerDelegate {
   func sceneDismissed()
}

class StoryViewController: UIViewController {
    
    var numStory = 0
    let stars = UIImageView(image: UIImage(named: "fundo"))
    let dogView = UIImageView(image: UIImage(named: "cachorra"))
    let balao = UIImageView(image: UIImage(named: "balao"))
    var story = UILabel()
    let voltar = UIButton(configuration: .filled())
    let continuar = UIButton(configuration: .filled())
    let stackView = UIStackView()
    
    var scene: GameScene?
    let gameJP = GameView()
    let guacamole = GuacamoleView()
    
    let winView = WinView()
    let loseView = LoseView()
    
    var textStatus = true
    var mission : [String] = ["", ""]
    
    var leftButton = ArrowButton()
    var rightButton = ArrowButton()

    let goBack = CustomButton()
    let goOn = CustomButton()
    
    var delegate : sendTabBarInfo?

    var delegate2: SecondViewControllerDelegate?

    
override var prefersStatusBarHidden: Bool {
    get {
        return true
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        if (isBeingDismissed || isMovingFromParent) {
//            print("perdeu, pai")
//            self.delegate2?.sceneDismissed()
//            self.navigationController?.popViewController(animated: true)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(red: 0, green: 0.051, blue: 0.165, alpha: 1)

        story.text = mission[0]
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupViewHierarchy(){
        self.view.addSubview(stars)
        self.view.addSubview(balao)
        self.view.addSubview(dogView)
        dogView.frame = CGRect(x: 0, y: 0, width: 192, height: 403)
        self.view.addSubview(stackView)
        self.view.addSubview(story)
        
        stackView.addArrangedSubview(goBack)
        stackView.addArrangedSubview(goOn)

        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
        
        
    }
    
    func setupViewAttributes(){
        voltar.setTitle("VOLTAR", for: .normal)
        continuar.setTitle("CONTINUAR", for: .normal)
        
        stackView.spacing = 30
        
        story.textAlignment = .center
        
        story.numberOfLines = 3
        story.adjustsFontSizeToFitWidth = true
        story.font = story.font.withSize(300)
        
        leftButton.setLeft()
        rightButton.setRight()

        stackView.distribution = .fillProportionally
        
        goOn.setContinuar()
        goOn.contentMode = .scaleAspectFit
        goBack.setVoltar()
        goBack.contentMode = .scaleAspectFit
        
        gameJP.delegate = self
        guacamole.delegate = self
        
        loseView.delegate = self
        winView.delegate = self
        
    }
    
    func setupConstraints(){
        //MARK: - Balao Constraints
        balao.contentMode = .scaleAspectFit
        balao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balao.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            balao.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            balao.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            balao.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            balao.heightAnchor.constraint(equalTo: balao.widthAnchor, multiplier: 0.85)
        ])
        
        //MARK: - Texto do balao Constraints
        story.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            story.topAnchor.constraint(equalTo: balao.topAnchor, constant: 20),
            story.trailingAnchor.constraint(equalTo: balao.trailingAnchor, constant: -30),
            story.leadingAnchor.constraint(equalTo: balao.leadingAnchor, constant: 30),
            story.bottomAnchor.constraint(equalTo: rightButton.topAnchor)
//            story.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        //MARK: - Botao esquerda Constraints
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: story.leadingAnchor, constant: 30),
            leftButton.bottomAnchor.constraint(equalTo: balao
                .bottomAnchor, constant: -90)
        ])
        
        //MARK: - Botao Direita Constraints
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: story.trailingAnchor, constant: -30),
            rightButton.bottomAnchor.constraint(equalTo: balao
                .bottomAnchor, constant: -90)
        ])
        
        //MARK: - Cachorra Constraints
        dogView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dogView.topAnchor.constraint(equalTo: balao.bottomAnchor, constant: -100),
            dogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        //MARK: - Botoes de voltar e continuar Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stars.topAnchor.constraint(equalTo: self.view.topAnchor),
            stars.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stars.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stars.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        goBack.addTarget(self, action:#selector(returnToShip), for: .touchUpInside)
        
        goOn.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        
        leftButton.addTarget(self, action: #selector(previousPage), for: .touchUpInside)
        
        rightButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
    }
    
    @objc func previousPage(sender: UIButton) {
        story.text = mission[0]
        rightButton.unPress()
    }
    
    @objc func nextPage(sender: UIButton) {
        story.text = mission[1]
        leftButton.unPress()
    }
    
    @objc func returnToShip(sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        leftButton.resetButtons()
        rightButton.resetButtons()
    }
    
    @objc func goToGame(sender: UIButton) {
        if (numStory == 1){
            super.loadView()
            self.view = SKView()
            self.view.bounds = UIScreen.main.bounds

            if let view = self.view as? SKView, scene == nil {
                let scene = GameScene(size: view.bounds.size)
                view.presentScene(scene)
                }
            
        } else if (numStory == 2){
            self.view = gameJP
        } else {
            self.view = guacamole
            guacamole.startGame()
        }
    }
    
    func setStory(numStory : Int){
        self.numStory = numStory
        if (numStory == 1){
        mission[0] = "Asteroides\nest??o a caminho do\nplaneta Ka??!"
        mission[1] = "Chegue l??\na tempo de evacuar\nseus habitantes."
        } else if (numStory == 2){
        
        mission[0] = "A temperatura\ndo planeta Zo'??s\nest?? doida!"
        mission[1] = "Equilibre seu\ntermostato sempre\nque mudar."
        } else {
        mission[0] = "O planeta Bestega\nsofre de uma praga\nalien??gena!"
        mission[1] = "Tente acert??-la\nno momento em que\nsair do buraco."
        }
        story.text = mission[0]
    }
    
}

extension StoryViewController : LoseViewDelegate, WinViewDelegate, GameViewDelegate {
    func won() {
        self.view = winView
    }
    
    func lost() {
        self.view = loseView
    }
    
    func goBreguecos() {
        self.view = UIView()
        delegate?.pass()
        dismiss(animated: true)
    }
    
    func goNave() {
        self.view = UIView()
        dismiss(animated: true)
    }
    
    func goGame() {
        if (numStory == 1){
            print("joga meteoro de novo")
        } else if (numStory == 2){
            self.view = gameJP
        } else {
            self.view = guacamole
            guacamole.startGame()
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
