//
//  MoleButton.swift
//  Foguetin
//
//  Created by aaav on 22/09/22.
//

import UIKit

class MoleButton: UIButton {

    let hole = UIImage(named: "hole")
    let mole = UIImage(named: "mole")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    func setMole(){
        self.setImage(mole, for: .normal)
    }
    
    func setHole(){
        self.setImage(hole, for: .normal)
    }

}
