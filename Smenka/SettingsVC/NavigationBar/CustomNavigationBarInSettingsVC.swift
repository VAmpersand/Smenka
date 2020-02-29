//
//  CustomNavigationBarInSettingsVC.swift
//  Smenka
//
//  Created by Viktor on 27.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

protocol ThemeChangingDelegate: class {
    func themeIsTogle()
}

@IBDesignable class CustomNavigationBarInSettingsVC: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var themeTogleButton: UIButton!
    
    var theme = ThemeStyle.light
    
    weak var delegate: ThemeChangingDelegate?
    
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
        contentView.backgroundColor = Style.burColor
        titleLabel.textColor = Style.labelColor
        themeTogleButton.tintColor = Style.buttonColor
        self.makeShadow()
    }
    
    @IBAction func themeIsTogle(_ sender: UIButton) {
        
        if theme == .dark {
            sender.setTitle("Dark", for: .normal)
            theme = .light
            Style.themeLight()
        } else {
            sender.setTitle("Light", for: .normal)
            theme = .dark
            Style.themeDark()
        }
        contentView.backgroundColor = Style.burColor
        titleLabel.textColor = Style.labelColor
        themeTogleButton.tintColor = Style.buttonColor
        
        let mainVC = MainViewController.initMainVC(theme: theme)
        mainVC.setDesign()
        
        delegate?.themeIsTogle()
    }
}
