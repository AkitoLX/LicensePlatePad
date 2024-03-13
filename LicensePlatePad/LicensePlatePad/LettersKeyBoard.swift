//
//  LettersKeyBoard.swift
//
//
//  Created by Akito on 2021/3/15.
//

import UIKit
///字母键盘
class NumbersAndLettersKeyBoard: UIView, KeyBoardHelperProtocol{
    var delegate: KeyBoardActionDelegate?
    init() {
        /// 按钮边距
        let margin: CGFloat = 12
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        /// 键盘高度
        let KeyBoardHeight = (screenHeight / 2) - 50 // 取屏幕高度的一半，再减50冗余
        /// 按钮宽度
        let buttonWidth = (screenWidth - (margin * 11)) / 10 //边距11个，10列
        /// 按钮高度
        let buttonHeight = (KeyBoardHeight - (margin * 5)) / 4//边距5个，4行
        /// 第一行按键与键盘的边距
        let line1TopMargin: CGFloat = margin / 2
        super.init(frame: .init(x: 0, y: 0, width: screenWidth, height: KeyBoardHeight + 10))//冗余10
        let line1 = ["1","2","3","4","5","6","7","8","9","0"]
        var i: CGFloat = 0
        for item in line1 {
            let rect = CGRect(x: i * (buttonWidth + margin) + margin, y: line1TopMargin, width: buttonWidth, height: buttonHeight)
            let button = getButton(title: item, frame: rect)
            self.addSubview(button)
            i += 1
        }
        let line2 = ["Q","W","E","R","T","Y","U","I","O","P"]
        i = 0
        for item in line2 {
            let rect = CGRect(x: i * (buttonWidth + margin) + margin, y: (line1TopMargin + margin) + buttonHeight, width: buttonWidth, height: buttonHeight)
            let button = getButton(title: item, frame: rect)
            self.addSubview(button)
            i += 1
        }
        let line3 = ["A","S","D","F","G","H","J","K","L"]
        i = 0
        for item in line3 {
            let rect = CGRect(x: i * (buttonWidth + margin) + margin + buttonWidth * 0.5, y: (margin * 2 + line1TopMargin) + (buttonHeight * 2) , width: buttonWidth, height: buttonHeight)
            let button = getButton(title: item, frame: rect)
            self.addSubview(button)
            i += 1
        }
        let line4 = ["Z","X","C","V","B","N","M"]
        i = 0
        var lastButton: UIButton?
        for item in line4 {
            let rect = CGRect(x: (i + 1) * (buttonWidth + margin) + margin + buttonWidth * 0.5, y: (margin * 3 + line1TopMargin) + (buttonHeight * 3), width: buttonWidth, height: buttonHeight)
            let button = getButton(title: item, frame: rect)
            if Int(i) == line4.count - 1 {
                //获取最后一个按键
                lastButton = button
            }
            self.addSubview(button)
            i += 1
        }
        if let lastButton = lastButton {
            let lastButtonWidth = self.frame.size.width - lastButton.frame.maxX - (margin * 2)
            let rect = CGRect(x: lastButton.frame.maxX + margin, y: lastButton.frame.origin.y, width: lastButtonWidth, height: buttonHeight)
            //添加退格键
            let backSpaceButton = creatBackSpaceButton(frame: rect, action: #selector(backSpaceClick))
            backSpaceButton.layer.cornerRadius = 10
//            backSpaceButton.layer.shadowRadius = 10
            let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(backSpaceLongPress(sender:)))
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(backSpaceLongPress(sender:)))
            backSpaceButton.addGestureRecognizer(longPress)
            backSpaceButton.addGestureRecognizer(pan)
            self.addSubview(backSpaceButton)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getButton(title: String, frame: CGRect) -> UIButton {
        let button = creatButton(title: title, frame: frame, touchUpAction: #selector(buttonAction(sender:)))
        button.layer.cornerRadius = 10
//        button.layer.shadowRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }
    @objc func buttonAction(sender: UIButton){
        SystemSound.pressClick.play()
        delegate?.buttonClick(value: sender.currentTitle)
    }
    @objc func backSpaceClick(){
        SystemSound.pressDelete.play()
        delegate?.backSpace()
    }
    
    var timer: Timer?
    @objc func backSpaceLongPress(sender: UILongPressGestureRecognizer){
        let button = sender.view as? UIButton
        if sender.state == .began {
            button?.isSelected = true
            timer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(backSpaceClick), userInfo: nil, repeats: true)
        }else if(sender.state == .ended || sender.state == .cancelled){
            timer?.invalidate()
            timer = nil
            button?.isSelected = false
        }
    }
}

