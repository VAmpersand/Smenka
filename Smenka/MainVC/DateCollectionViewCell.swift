//
//  DateCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var shiftView: UIView!
    
    func drowCircleForToday(color: UIColor) {
        
        let centerXY = CGPoint(x: 23.5, y: 23.5)
        
        let circlePath = UIBezierPath(arcCenter: centerXY, radius: CGFloat(20), startAngle: (3 * CGFloat.pi / 2), endAngle: (9 * CGFloat.pi / 2), clockwise: true)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineWidth = 2
        circleLayer.strokeEnd = 0
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = CAShapeLayerLineCap.round
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.toValue = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        circleLayer.add(animation, forKey: nil)
        
        shiftView.layer.addSublayer(circleLayer)
        shiftView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
}
