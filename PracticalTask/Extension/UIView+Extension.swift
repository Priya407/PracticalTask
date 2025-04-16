//
//  UIView+Extension.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import Foundation
import UIKit

class RightCurveView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let rect = self.bounds
        let x: CGFloat = rect.width - 25.0
        let curveTo: CGFloat = rect.width
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: x, y: 0.0))
        bezierPath.addQuadCurve(to: CGPoint(x: x, y: rect.height),
                                controlPoint: CGPoint(x: curveTo, y: rect.height / 2.0))
        bezierPath.addLine(to: CGPoint(x: 0.0, y: rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.0, y: 0.0))
        bezierPath.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        self.layer.mask = maskLayer
        
        self.layer.shadowPath = bezierPath.cgPath
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 10, height: 10)  // Adjust shadow direction as needed
        self.layer.shadowRadius = 20  // Adjust shadow softness as needed
        self.layer.masksToBounds = false
    }
}
