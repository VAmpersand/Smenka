//
//  CustomNavigationBarInSettingsVC.swift
//  Smenka
//
//  Created by Viktor on 27.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

protocol SettingsNavigationBarDelegate: class {
    func themeIsTogle()
}

@IBDesignable class CustomNavigationBarInSettingsVC: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var themeTogleButton: UIButton!
    
    var theme = ThemeStyle.dark
    
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
        self.makeShadow()
    }
    
    
    @IBAction func themeIsTogle(_ sender: UIButton) {
        delegate?.themeIsTogle()
        
        if theme == .dark {
            sender.titleLabel?.text = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.titleLabel?.text = "Light"
            theme = .dark
            Style.themeDark()
        }
    }
}
