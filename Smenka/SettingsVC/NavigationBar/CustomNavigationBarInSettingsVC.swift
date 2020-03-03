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
    
    var theme: ThemeStyle!
    
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
                
        guard let defTheme = defaultThemeStyle.value(forKey: "defaultTheme") as? String else { return }
        if defTheme == "dark" {
            theme = .dark
        } else {
            theme = .light
        }
        
        titleLabel.text = "Settings"
        setDesign()
    }
    
    @IBAction func themeIsTogle(_ sender: UIButton) {
        
        if theme == .dark {
            theme = .light
            Style.themeLight()
        } else {
            theme = .dark
            Style.themeDark()
        }
        
        let mainVC = MainViewController.initMainVC()
        mainVC.setDesign()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "light"), object: nil)
        
        setDesign()
        setThemeInDefault(theme: theme)
        
        delegate?.themeIsTogle()
    }
    
    
    func setDesign() {
        
        if theme == .dark {
            themeTogleButton.setTitle("Light", for: .normal)
        } else {
            themeTogleButton.setTitle("Dark", for: .normal)
        }
    
        contentView.backgroundColor = Style.barColor
        titleLabel.textColor = Style.labelColor
        themeTogleButton.tintColor = Style.buttonColor
        self.makeShadow()
    }
}
