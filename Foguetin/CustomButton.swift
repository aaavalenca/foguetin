//
//  CustomButton.swift
//  Foguetin
//
//  Created by aaav on 22/09/22.
//

import UIKit

class CustomButton: UIButton {

    let buttons = [UIImage(named: "Comecar"),
                   UIImage(named: "Continuar"),
                   UIImage(named: "Vamosla"),
                   UIImage(named: "Voltar"),
                   UIImage(named: "Pular")
                    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    func setComecar(){
        self.setImage(buttons[0], for: .normal)
    }
    
    func setContinuar(){
        self.setImage(buttons[1], for: .normal)
    }
    
    func setVamosLa(){
        self.setImage(buttons[2], for: .normal)
    }
    
    func setVoltar(){
        self.setImage(buttons[3], for: .normal)
    }
    
    func setPular(){
        self.setImage(buttons[4], for: .normal)
    }
    
}
