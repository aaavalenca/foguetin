//
//  WinLoseButton.swift
//  Foguetin
//
//  Created by aaav on 22/09/22.
//

import UIKit

class WinLoseButton: UIButton {

    let buttons = [UIImage(named: "vinganca"),
                   UIImage(named: "pegar"),
                   UIImage(named: "desistir")
                    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    func setVinganca(){
        self.setImage(buttons[0], for: .normal)
    }
    
    func setPegar(){
        self.setImage(buttons[1], for: .normal)
    }
    
    func setDesistir(){
        self.setImage(buttons[2], for: .normal)
    }

}
