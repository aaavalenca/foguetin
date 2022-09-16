//
//  ArrowButton.swift
//  Foguetin
//
//  Created by aaav on 16/09/22.
//

import UIKit

class ArrowButton: UIButton {
    
    var side = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setRight(){
        self.setImage(UIImage(named: "buttonArrowRight"), for: .normal)
        side = true
    }
    
    func setLeft(){
        self.setImage(UIImage(named: "buttonArrowLeft"), for: .normal)
        side = false
    }
    
    
    @objc func onPress(){
        if (side) {
            self.setImage(UIImage(named: "buttonArrowRightPressed"), for: .normal)
        } else {
            self.setImage(UIImage(named: "buttonArrowLeftPressed"), for: .normal)
        }
    }
    
    func unPress(){
        if (side) {
            self.setImage(UIImage(named: "buttonArrowRight"), for: .normal)
        } else {
            self.setImage(UIImage(named: "buttonArrowLeft"), for: .normal)
        }
    }
    

}
