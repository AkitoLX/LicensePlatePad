//
//  KeyBoardHelperProtocol.swift
//  Demo
//
//  Created by Akito on 2021/3/2.
//

import UIKit

protocol KeyBoardHelperProtocol: NSObjectProtocol{
    func creatImageWithColor(color: UIColor,size: CGSize) -> UIImage?
    func creatButton(title: String, frame: CGRect, touchUpAction: Selector) -> UIButton
    func creatBackSpaceButton(frame: CGRect, action: Selector) -> UIButton
}

extension KeyBoardHelperProtocol{
    
    func creatImageWithColor(color: UIColor, size: CGSize) -> UIImage?{
        var image: UIImage?
        let rect = CGRect(x:0,y:0,width:size.width,height:size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context!.fill(rect)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 创建普通按钮
    /// - Parameters:
    ///   - title: 标题
    ///   - backgroundImage: 背景图片
    func creatButton(title: String, frame: CGRect, touchUpAction: Selector) -> UIButton {
        let button = KeyBoardButton.init(frame: frame)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: touchUpAction, for: .touchUpInside)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.label, for: .normal)
        return button
    }
    
    /// 创建退格键按钮
    func creatBackSpaceButton(frame: CGRect, action: Selector) -> UIButton{
        let button = KeyBoardButton.init(frame: frame)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.setImage(UIImage(systemName: "delete.left.fill"), for: .selected)
        button.setImage(UIImage(systemName: "delete.left.fill"), for: .highlighted)
        button.tintColor = .label
        return button
    }
}


protocol KeyBoardActionDelegate: NSObjectProtocol{
    func buttonClick(value: String?)
    func backSpace()
}



