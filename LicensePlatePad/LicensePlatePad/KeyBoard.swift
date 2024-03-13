//
//  KeyBoard.swift
//  Demo
//
//  Created by Akito on 2021/3/2.
//

import UIKit
extension UITextField{
    func setupLicensePlatePad(){
        let keyBoard = LicensePlatePad()
        keyBoard.delegate = self
        inputView = keyBoard
    }
}

class LicensePlatePad: UIView, KeyBoardActionDelegate{
    weak var delegate: KeyBoardActionDelegate?
    
    init(){
        let screenWidth = UIScreen.main.bounds.size.width
        ///键盘高度屏幕高度的1/3
        let height = UIScreen.main.bounds.size.height / 3
        /// 子键盘宽度，分左右两个键盘
        let keyBoardWidth = screenWidth / 2
        ///子键盘高度，冗余10
        let keyBoardHeight = height - 15
        super.init(frame: .init(x: 0, y: 0, width: screenWidth, height: height))
        self.backgroundColor = .init(red: 212/255, green: 212/255, blue: 217/255, alpha: 1)
        
        //左侧车牌中文键盘
        let licensePlateNoKeyBoard = LicensePlateNoKeyBoard.init(frame: .init(x: 0, y: 0, width: keyBoardWidth, height: keyBoardHeight))
        licensePlateNoKeyBoard.delegate = self
        self.addSubview(licensePlateNoKeyBoard)
        
        //右侧数字字母键盘
        let lettersKeyBoard = LettersKeyBoard.init(frame: .init(x: licensePlateNoKeyBoard.bounds.size.width, y: 0, width: keyBoardWidth, height: keyBoardHeight))
        lettersKeyBoard.delegate = self
        self.addSubview(lettersKeyBoard)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonClick(value: String?) {
        delegate?.buttonClick(value: value)
    }
    
    func backSpace() {
        delegate?.backSpace()
    }
    
    
}

extension UITextField: KeyBoardActionDelegate{
    func buttonClick(value: String?) {
        guard let text = value  else {
            return
        }
        self.insertText(text)
    }
    
    func backSpace() {
        self.deleteBackward()
    }
    
    
}
