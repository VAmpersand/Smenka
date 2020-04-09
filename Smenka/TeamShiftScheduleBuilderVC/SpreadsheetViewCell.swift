//
//  SpreadsheetViewCell.swift
//  Smenka
//
//  Created by Viktor on 06.04.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import SpreadsheetView

class SpreadsheetViewCell: Cell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        addSubview(label)
    }
    
    private func setConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0]-5-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": label]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": label]))
    }
}
