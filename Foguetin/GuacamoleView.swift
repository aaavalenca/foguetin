//
//  SecondGameView.swift
//  game with placeholders
//
//  Created by Jpsmor on 21/09/22.
//

import UIKit

class GuacamoleView: UIView {
    
    
    let button0 = MoleButton()
    let button1 = MoleButton()
    let button2 = MoleButton()
    let button3 = MoleButton()
    let button4 = MoleButton()
    let button5 = MoleButton()
    let button6 = MoleButton()
    let button7 = MoleButton()
    let button8 = MoleButton()
    let button9 = MoleButton()
    let button10 = MoleButton()
    let button11 = MoleButton()
    let alienView = UIImageView()
    let timerLabel = UILabel()
    
    let winView = WinView()
    let loseView = WinView()
    
    let stackallViews = UIStackView()
    let stack02Buttons = UIStackView()
    let stack35Buttons = UIStackView()
    let stack68Buttons = UIStackView()
    let stack911Buttons = UIStackView()
    
    var currentTime = 10
    var alienPosition = Int.random(in: 0...11)
    var timer : Timer?
    var alienPositionTimer : Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsHierarchy()
        setViewsAttributes()
        setConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewsHierarchy() {
        addSubview(stackallViews)
        
        stack02Buttons.addArrangedSubview(button0)
        stack02Buttons.addArrangedSubview(button1)
        stack02Buttons.addArrangedSubview(button2)
        
        stack35Buttons.addArrangedSubview(button3)
        stack35Buttons.addArrangedSubview(button4)
        stack35Buttons.addArrangedSubview(button5)
        
        stack68Buttons.addArrangedSubview(button6)
        stack68Buttons.addArrangedSubview(button7)
        stack68Buttons.addArrangedSubview(button8)
        
        stack911Buttons.addArrangedSubview(button9)
        stack911Buttons.addArrangedSubview(button10)
        stack911Buttons.addArrangedSubview(button11)
        
        stackallViews.addArrangedSubview(timerLabel)
        stackallViews.addArrangedSubview(stack02Buttons)
        stackallViews.addArrangedSubview(stack35Buttons)
        stackallViews.addArrangedSubview(stack68Buttons)
        stackallViews.addArrangedSubview(stack911Buttons)
    }
    
    func setViewsAttributes () {
        
        self.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        stackallViews.backgroundColor = UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        self.backgroundColor = UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        stack02Buttons.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        stack68Buttons.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        stack35Buttons.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        stack911Buttons.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        timerLabel.backgroundColor =  UIColor(red: 0.098, green: 0.584, blue: 0.098, alpha: 1)
        timerLabel.font = UIFont.systemFont(ofSize: 70)
        button0.setHole()
        button1.setHole()
        button2.setHole()
        button3.setHole()
        button4.setHole()
        button5.setHole()
        button6.setHole()
        button7.setHole()
        button8.setHole()
        button9.setHole()
        button10.setHole()
        button11.setHole()
        
        stackallViews.axis = .vertical
        stackallViews.alignment = .fill
        stackallViews.distribution = .fillEqually
        stackallViews.spacing = 20
        
        stack02Buttons.axis = .horizontal
        stack02Buttons.alignment = .fill
        stack02Buttons.distribution = .fillEqually
        stack02Buttons.spacing = 10
        
        stack35Buttons.axis = .horizontal
        stack35Buttons.alignment = .fill
        stack35Buttons.distribution = .fillEqually
        stack35Buttons.spacing = 10
        
        stack68Buttons.axis = .horizontal
        stack68Buttons.alignment = .fill
        stack68Buttons.distribution = .fillEqually
        stack68Buttons.spacing = 10
        
        stack911Buttons.axis = .horizontal
        stack911Buttons.alignment = .fill
        stack911Buttons.distribution = .fillEqually
        stack911Buttons.spacing = 10
        
        timerLabel.text = String(currentTime)
        timerLabel.textAlignment = .center
        
        button0.accessibilityLabel = "0"
        button1.accessibilityLabel = "1"
        button2.accessibilityLabel = "2"
        button3.accessibilityLabel = "3"
        button4.accessibilityLabel = "4"
        button5.accessibilityLabel = "5"
        button6.accessibilityLabel = "6"
        button7.accessibilityLabel = "7"
        button8.accessibilityLabel = "8"
        button9.accessibilityLabel = "9"
        button10.accessibilityLabel = "10"
        button11.accessibilityLabel = "11"
    }
    
    func setConstraints () {
        stackallViews.translatesAutoresizingMaskIntoConstraints = false
        stack02Buttons.translatesAutoresizingMaskIntoConstraints = false
        stack35Buttons.translatesAutoresizingMaskIntoConstraints = false
        stack68Buttons.translatesAutoresizingMaskIntoConstraints = false
        stack911Buttons.translatesAutoresizingMaskIntoConstraints = false
        button0.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        button6.translatesAutoresizingMaskIntoConstraints = false
        button7.translatesAutoresizingMaskIntoConstraints = false
        button8.translatesAutoresizingMaskIntoConstraints = false
        button9.translatesAutoresizingMaskIntoConstraints = false
        button10.translatesAutoresizingMaskIntoConstraints = false
        button11.translatesAutoresizingMaskIntoConstraints = false
        
        //stackViews
        NSLayoutConstraint.activate([
            stackallViews.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackallViews.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackallViews.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackallViews.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
    func setupAdditionalConfiguration () {
        startGame()
        button0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button4.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button5.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button6.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button7.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button8.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button9.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button10.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button11.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
        alienPositionTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeAlienPosition), userInfo: nil, repeats: true)
        
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if String(alienPosition) == sender.accessibilityLabel {
            self.addSubview(winView)
            winView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                winView.topAnchor.constraint(equalTo: self.topAnchor),
                winView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                winView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                winView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }
    
    @objc func updateTimerLabel () {
        if currentTime == 0 {
            self.addSubview(loseView)
            loseView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                loseView.topAnchor.constraint(equalTo: self.topAnchor),
                loseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                loseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                loseView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            return
        }
        currentTime -= 1
        timerLabel.text = String(currentTime)
    }
    
    @objc func changeAlienPosition () {
        alienPosition = Int.random(in: 0...11)
        
        button0.setHole()
        button1.setHole()
        button2.setHole()
        button3.setHole()
        button4.setHole()
        button5.setHole()
        button6.setHole()
        button7.setHole()
        button8.setHole()
        button9.setHole()
        button10.setHole()
        button11.setHole()
        
        switch alienPosition {
        case 0:
            button0.setMole()
        case 1:
            button1.setMole()
        case 2:
            button2.setMole()
        case 3:
            button3.setMole()
        case 4:
            button4.setMole()
        case 5:
            button5.setMole()
        case 6:
            button6.setMole()
        case 7:
            button7.setMole()
        case 8:
            button8.setMole()
        case 9:
            button9.setMole()
        case 10:
            button10.setMole()
        case 11:
            button11.setMole()
            
            
            
        default:
            print ("error")
        }
    }
    
    
}



// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview_Guacamole: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            GuacamoleView().showPreview().previewDevice("iPhone 11")
            //            ViewController().showPreview().previewDevice("iPhone 11").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
