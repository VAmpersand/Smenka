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
    @IBOutlet weak var shiftColorView: UIView!
    
    func drowCircle() {
        
        let center = shiftColorView.center
        
        let circlePath = UIBezierPath(arcCenter: center, radius: (shiftColorView.bounds.width / 2 - 5), startAngle: (3 * CGFloat.pi / 2), endAngle: (9 * CGFloat.pi / 2), clockwise: true)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 2
        circleLayer.strokeEnd = 0
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = CAShapeLayerLineCap.round
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.5
        animation.toValue = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        circleLayer.add(animation, forKey: nil)
        
        shiftColorView.layer.addSublayer(circleLayer)
        shiftColorView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    
}
