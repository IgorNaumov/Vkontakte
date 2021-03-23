//
//  Avatar.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 18.02.2021.
//

import UIKit


@IBDesignable class Shadow: UIView {

    
    @IBInspectable var color: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var opacity: CGFloat = 1 {
        didSet {
            self.updateOpacity()
        }
    }
    @IBInspectable var radius: CGFloat = 7 {
        didSet {
            self.udateRadius()
        }
    }
    @IBInspectable var offset: CGSize = .zero {
        didSet{
            self.updateOffset()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    var shadowLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    func updateColors(){
        self.shadowLayer.shadowColor = self.color.cgColor
    }
    func updateOpacity(){
        self.shadowLayer.shadowOpacity = Float(self.opacity)
    }
    func udateRadius(){
        self.shadowLayer.shadowRadius = self.radius
    }
    func updateOffset(){
        self.shadowLayer.shadowOffset = offset
    }
    
}
