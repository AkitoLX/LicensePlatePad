//
//  KeyBoardButton.swift
//  Demo
//
//  Created by Akito on 2021/3/18.
//

import UIKit

class KeyBoardButton: UIButton{
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted || isSelected ? UIColor.systemGray2 : UIColor.systemBackground
        }
    }
    
    override var isSelected: Bool{
        didSet{
            backgroundColor = isSelected ? UIColor.systemGray2 : UIColor.systemBackground
        }
    }
}
