//
//  ViewController.swift
//  hw5
//
//  Created by Carlos Lemus on 2/26/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tapGestureRecognizer: UITapGestureRecognizer!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    var controlPoint: CGPoint?
    
    let path = UIBezierPath()
    
    var curveCount = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    
        firstPoint = CGPoint(x: 50, y: 50)
        secondPoint =  CGPoint(x: UIScreen.main.bounds.width - 50 , y: UIScreen.main.bounds.height/2 - 50 )
        
       // addLine(fromPoint: firstPoint!, toPoint: secondPoint!)
       // createCurve(fromPoint: firstPoint!, toPoint: secondPoint!)
        
        
    }
    
    func createCurve(fromPoint start: CGPoint, toPoint end: CGPoint){
        
            let quadCurve = CAShapeLayer()
            controlPoint = CGPoint(x: (start.x + CGFloat(curveCount*10)) , y: (end.y - CGFloat(curveCount*10)))
            path.move(to: start)
            path.addQuadCurve(to: end, controlPoint: controlPoint!)
            
            quadCurve.fillColor = UIColor.white.cgColor
            quadCurve.path = path.cgPath
            quadCurve.strokeColor = UIColor.red.cgColor
            quadCurve.lineWidth = 1
            quadCurve.lineJoin = kCALineJoinRound
            self.view.layer.addSublayer(quadCurve)
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            let touchPoint = sender.location(in: self.view)
            
            controlPoint = touchPoint
            
            path.move(to: firstPoint!)
            path.addQuadCurve(to: secondPoint!, controlPoint: controlPoint!)
            
            
            let line = CAShapeLayer()
            
            line.fillColor = UIColor.white.cgColor
            line.path = path.cgPath
            line.strokeColor = UIColor.red.cgColor
            line.lineWidth = 1
            line.lineJoin = kCALineJoinRound
            self.view.layer.addSublayer(line)

        }
        
    }

    @IBAction func drawCurve(_ sender: Any) {
        
        createCurve(fromPoint: firstPoint!, toPoint: secondPoint!)
        curveCount += 1
    }
}

