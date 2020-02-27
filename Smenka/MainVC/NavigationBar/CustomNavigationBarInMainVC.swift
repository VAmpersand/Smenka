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
    var editButtonPressCheck = false
    
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
        
        deleteButton.isHidden = true
        titleLabel.text = "Calendar"
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        editButtonPressCheck.toggle()
                
                if editButtonPressCheck {
                    editButton.setTitle("Save", for: .normal)
//                    editButton.setTitleColor(.white, for: .normal)
                    deleteButton.isHidden = false
//                    deleteButton.setTitleColor(.white, for: .normal)
                } else {
                    self.editButton.setTitle("Edit", for: .normal)
//                    self.editButton.setTitleColor(.blue, for: .normal)
                    self.deleteButton.isHidden = true
            }
        
        delegate?.editAction()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        delegate?.deleteAction()
    }
    
}
