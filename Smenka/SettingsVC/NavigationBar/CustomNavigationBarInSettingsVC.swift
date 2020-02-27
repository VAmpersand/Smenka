//
//  CustomNavigationBarInSettingsVC.swift
//  Smenka
//
//  Created by Viktor on 27.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

protocol SettingsNavigationBarDelegate: class {
    func modeIsTogle()
}

@IBDesignable class CustomNavigationBarInSettingsVC: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var modTogleButton: UIButton!
    
    weak var delegate: SettingsNavigationBarDelegate?
    
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
        bundle.loadNibNamed("CustomNavigationBarInSettingsVC", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        titleLabel.text = "Settings"
    }
    
    
    @IBAction func modIsTogle(_ sender: Any) {
        delegate?.modeIsTogle()
    }
    
  

}
