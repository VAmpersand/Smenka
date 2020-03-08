//
//  CustomNavigationBarTeamShSchV.swift
//  Smenka
//
//  Created by Viktor on 08.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

protocol PresentShiftScheduleBuilderDelegate: class {
    func editButtonPressed()
}

@IBDesignable class CustomNavigationBarTeamShSchV: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    weak var delegate: PresentShiftScheduleBuilderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        
        let bundle = Bundle(for: CustomNavigationBarInMainVC.self)
        bundle.loadNibNamed("CustomNavigationBarShSchV", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setDesign()
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        delegate?.editButtonPressed()
    }
    
    func setDesign() {
        contentView.backgroundColor = Style.barBackgroundColor
        titleLabel.textColor = Style.labelColor
        editButton.setTitleColor(Style.buttonColor, for: .normal)
        
        titleLabel.text = "Team schedule"
        self.makeShadow()
    }
    
}
