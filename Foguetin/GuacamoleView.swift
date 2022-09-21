//
//  SecondGameView.swift
//  game with placeholders
//
//  Created by Jpsmor on 21/09/22.
//

import UIKit

class GuacamoleView: UIView {
    
    
    let button0 = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let button10 = UIButton()
    let button11 = UIButton()
    let alienView = UIImageView()
    let timerLabel = UILabel()
    
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
        
        stackallViews.backgroundColor = .systemOrange
        backgroundColor = .white
        stack02Buttons.backgroundColor = .black
        stack68Buttons.backgroundColor = .black
        stack35Buttons.backgroundColor = .black
        stack911Buttons.backgroundColor = .black
        timerLabel.backgroundColor = .green
        button0.backgroundColor = .darkGray
        button1.backgroundColor = .darkGray
        button2.backgroundColor = .darkGray
        button3.backgroundColor = .darkGray
        button4.backgroundColor = .darkGray
        button5.backgroundColor = .darkGray
        button6.backgroundColor = .darkGray
        button7.backgroundColor = .darkGray
        button8.backgroundColor = .darkGray
        button9.backgroundColor = .darkGray
        button10.backgroundColor = .darkGray
        button11.backgroundColor = .darkGray
        
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
            print("ganhou")
        }
        else
        {
            print ("perdeu")
        }
    }
    
    @objc func updateTimerLabel () {
        if currentTime == 0 {
            timerLabel.text = "the end"
            timer?.invalidate()
              timer = nil
            alienPositionTimer?.invalidate()
              alienPositionTimer = nil
            return
        }
        currentTime -= 1
        timerLabel.text = String(currentTime)
    }
    
    @objc func changeAlienPosition () {
        alienPosition = Int.random(in: 0...11)
        
        button0.backgroundColor = .darkGray
        button1.backgroundColor = .darkGray
        button2.backgroundColor = .darkGray
        button3.backgroundColor = .darkGray
        button4.backgroundColor = .darkGray
        button5.backgroundColor = .darkGray
        button6.backgroundColor = .darkGray
        button7.backgroundColor = .darkGray
        button8.backgroundColor = .darkGray
        button9.backgroundColor = .darkGray
        button10.backgroundColor = .darkGray
        button11.backgroundColor = .darkGray
        
        switch alienPosition {
        case 0:
            button0.backgroundColor = .cyan
        case 1:
            button1.backgroundColor = .cyan
        case 2:
            button2.backgroundColor = .cyan
        case 3:
            button3.backgroundColor = .cyan
        case 4:
            button4.backgroundColor = .cyan
        case 5:
            button5.backgroundColor = .cyan
        case 6:
            button6.backgroundColor = .cyan
        case 7:
            button7.backgroundColor = .cyan
        case 8:
            button8.backgroundColor = .cyan
        case 9:
            button9.backgroundColor = .cyan
        case 10:
            button10.backgroundColor = .cyan
        case 11:
            button11.backgroundColor = .cyan
            
            
            
        default:
            print ("error")
        }
    }
    
    
}
