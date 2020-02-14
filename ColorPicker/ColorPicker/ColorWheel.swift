//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by alfredo on 2/14/20.
//  Copyright © 2020 Alfredo. All rights reserved.
//

import UIKit

@IBDesignable
class ColorWheel: UIView {

    //MARK - Properties
    
    var color: UIColor = .white
    var brightness: CGFloat = 0.8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //MARK - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //turning it off because control will contain direct touch handling; this view view be a part of the control
        isUserInteractionEnabled = false
        //clip colors to bounds
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 1.0
        
        for y  in stride(from: 0, through: bounds.maxY, by: size) {
            for x in stride(from: 0, to: bounds.maxX, by: size) {
                
                let location = CGPoint(x: x, y: y)
                let color = self.color(for: location)
                let pixel = CGRect(x: x, y: y, width: size, height: size)
                
                color.set()
                
                UIRectFill(pixel)
            }
        }
        
    }
    
    func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let distancey = location.y - center.y
        let distancex = location.x - center.x
        let offset = CGPoint(x: distancex / center.x , y: distancey / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        //alpha == opacity
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }

}
