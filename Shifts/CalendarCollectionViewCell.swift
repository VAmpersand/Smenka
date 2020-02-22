//
//  CalendarCollectionViewCell.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellView: UIView!
    
    func drowCircleForToday(color: UIColor) {
        
        let centerXY = CGPoint(x: 25, y: 25)
        
        let circlePath = UIBezierPath(arcCenter: centerXY, radius: (cellView.bounds.width / 2 - 3), startAngle: (3 * CGFloat.pi / 2), endAngle: (9 * CGFloat.pi / 2), clockwise: true)
        
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
        
        cellView.layer.addSublayer(circleLayer)
        cellView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
}
