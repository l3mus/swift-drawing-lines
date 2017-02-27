//
//  Draw2D.swift
//  lineDraw
//
//  Created by Carlos Lemus on 2/25/17.
//  Copyright © 2017 unlv. All rights reserved.
//

import UIKit



class Draw2D: UIView {
    
    
    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0 , 0.0, 1.0, 1.0]
        let color = CGColor(colorSpace: colorSpace, components: components)
        context?.setStrokeColor(color!)
        context?.move(to: CGPoint(x:30, y: 30))
        context?.addLine(to: CGPoint(x:300, y: 400))
        context?.strokePath()
    }
}
