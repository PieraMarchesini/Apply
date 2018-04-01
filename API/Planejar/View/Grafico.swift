//
//  Grafico.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

@IBDesignable
class Grafico: UIView {
 
    @IBInspectable var pathBColor: UIColor = C.verdegrafico
    @IBInspectable var pathAColor: UIColor = C.azulgrafico
    
    @IBInspectable var investimentoA: CGFloat = 0.6{
        didSet {
                setNeedsDisplay()
        }
    }
    
    @IBInspectable var investimentoB: CGFloat = 0.3{
        didSet {
                setNeedsDisplay()
        }
    }
    
    private struct Constants {
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 20
    }
    
    
    override func draw(_ rect: CGRect) {

        
        
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = 2 * .pi * investimentoA
        
        let pathA = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        pathA.lineWidth = Constants.arcWidth
        pathAColor.setStroke()
        pathA.stroke()
        
        let startAngle2: CGFloat = endAngle
        let endAngle2: CGFloat =  2 * .pi * investimentoB + endAngle
        
        let pathB = UIBezierPath(arcCenter: center,
                                       radius: radius/2 - Constants.arcWidth/2,
                                       startAngle: startAngle2,
                                       endAngle: endAngle2,
                                       clockwise: true)
        
        pathB.lineWidth = Constants.arcWidth
        
        
        pathBColor.setStroke()
        pathB.stroke()
        
    }
    
    
}

