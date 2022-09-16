//
//  ArrowButton.swift
//  Foguetin
//
//  Created by aaav on 16/09/22.
//

import UIKit

class ArrowButton: UIButton {
    
    var rightSide = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setRight(){
        self.setImage(UIImage(named: "buttonArrowRight"), for: .normal)
        rightSide = true
    }
    
    func setLeft(){
        self.setImage(UIImage(named: "buttonArrowLeftPressed"), for: .normal)
        rightSide = false
    }
    
    
    @objc func onPress(){
        if (rightSide) {
            self.setImage(UIImage(named: "buttonArrowRightPressed"), for: .normal)
        } else {
            self.setImage(UIImage(named: "buttonArrowLeftPressed"), for: .normal)
        }
    }
    
    func unPress(){
        if (rightSide) {
            self.setImage(UIImage(named: "buttonArrowRight"), for: .normal)
        } else {
            self.setImage(UIImage(named: "buttonArrowLeft"), for: .normal)
        }
    }
    
    func resetButtons(){
        if(rightSide){
            self.setImage(UIImage(named: "buttonArrowRight"), for: .normal)
        } else {
            self.setImage(UIImage(named: "buttonArrowLeftPressed"), for: .normal)
        }
    }

}
