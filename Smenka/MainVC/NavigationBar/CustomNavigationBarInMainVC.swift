//
//  CustomNavigationBarInMainVC.swift
//  Smenka
//
//  Created by Viktor on 27.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

protocol MainNavigationBarDelegate: class {
    func editAction()
    func deleteAction()
}

@IBDesignable class CustomNavigationBarInMainVC: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    weak var delegate: MainNavigationBarDelegate?
    
    var editButtonPressed = false
    
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
        bundle.loadNibNamed("CustomNavigationBarInMainVC", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setDesign()
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        editButtonPressed.toggle()
        
        if editButtonPressed {
            editButton.setTitle("Save", for: .normal)
            editButton.setTitleColor(Style.buttonColor, for: .normal)
            deleteButton.isHidden = false
            deleteButton.setTitleColor(Style.buttonColor, for: .normal)
        } else {
            self.editButton.setTitle("Edit", for: .normal)
            self.editButton.setTitleColor(Style.buttonColor, for: .normal)
            self.deleteButton.isHidden = true
        }
        
        delegate?.editAction()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        delegate?.deleteAction()
    }
    
    func setDesign() {
        contentView.backgroundColor = Style.barColor
        titleLabel.textColor = Style.labelColor
        deleteButton.setTitleColor(Style.buttonColor, for: .normal)
        editButton.setTitleColor(Style.buttonColor, for: .normal)
        
        if editButtonPressed {
             deleteButton.isHidden = false
        } else {
            deleteButton.isHidden = true
        }
        
        titleLabel.text = "Calendar"
        self.makeShadow()
    }  
}


