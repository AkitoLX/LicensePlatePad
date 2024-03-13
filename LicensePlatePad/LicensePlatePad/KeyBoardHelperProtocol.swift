//
//  KeyBoardHelperProtocol.swift
//  Demo
//
//  Created by Akito on 2021/3/2.
//

import UIKit

protocol KeyBoardHelperProtocol: NSObjectProtocol{
    func creatImageWithColor(color: UIColor,size: CGSize) -> UIImage?
    func creatButton(title: String, backgroundImage: UIImage?, frame: CGRect, touchUpAction: Selector) -> UIButton
    func creatBackSpaceButton(frame: CGRect, action: Selector) -> UIButton
    func getDoneButton(action: Selector) -> [UIBarButtonItemGroup]
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
    func creatButton(title: String, backgroundImage: UIImage? = nil, frame: CGRect, touchUpAction: Selector) -> UIButton {
        let button = KeyBoardButton.init(frame: frame)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: touchUpAction, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setTitleColor(.black, for: .normal)
        //设置阴影
//        button.layer.shadowPath = UIBezierPath.init(rect: button.bounds).cgPath
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize.init(width: 0, height: -3)
//        button.layer.shadowRadius = 8
//        button.layer.shadowOpacity = 1
        
//        // spread 对应 Sketch 里阴影的 “扩展”，值是 10
//        let spread: CGFloat = 1
//        var rect = CGRect(x: 0, y: 0, width: button.bounds.width, height: button.bounds.height);
//        rect = rect.insetBy(dx: -spread, dy: -spread)
//
//        button.layer.shadowPath = UIBezierPath(rect: rect).cgPath
//        // 颜色是黑色（ #000000 ）
//        button.layer.shadowColor = UIColor.black.cgColor
//        // alpha 50
//        button.layer.shadowOpacity = 0.5
//        // X: 0  Y: 10
//        button.layer.shadowOffset = CGSize(width: 1, height: 1)
//        // 对应 Sketch 里阴影的 “模糊” 的设置，值是 20 / 2 = 10
//        button.layer.shadowRadius = 8
        
        return button
    }
    
    /// 创建退格键按钮
    func creatBackSpaceButton(frame: CGRect, action: Selector) -> UIButton{
        let button = KeyBoardButton.init(frame: frame)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.setImage(UIImage(systemName: "delete.left.fill"), for: .selected)
        button.setImage(UIImage(systemName: "delete.left.fill"), for: .highlighted)
        button.tintColor = .black
        //设置阴影
//        button.layer.shadowPath = UIBezierPath.init(rect: button.bounds).cgPath
//        button.layer.shadowColor = UIColor.gray.cgColor
//        button.layer.shadowOffset = CGSize.init(width: 5, height: 5)
//        button.layer.shadowRadius = 8
//        button.layer.shadowOpacity = 0.5
//        button.setBackgroundImage(creatImageWithColor(color: .lightGray, size: button.bounds.size), for: .highlighted)
        return button
    }
    /// 获取完成按钮
    func getDoneButton(action: Selector) -> [UIBarButtonItemGroup]{
        var buttons = [UIBarButtonItem]()
        buttons.append(.init(title: "完成", style: .done, target: self, action: action))
        let  buttonItem: [UIBarButtonItemGroup] = [UIBarButtonItemGroup(barButtonItems: buttons, representativeItem: nil)]
        return buttonItem
    }
}


protocol KeyBoardActionDelegate: NSObjectProtocol{
    func buttonClick(value: String?)
    func backSpace()
}



