//
//  TeamShSchCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 08.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
//
//class TeamShSchCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    private let cellID = "dateCellID"
//    var calendarData: [Any]!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let dateCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collectionView
//        }()
//    
//    func setupViews() {
//        dateCollectionView.backgroundColor = .clear
//        dateCollectionView.delegate = self
//        dateCollectionView.dataSource = self
//        
//        dateCollectionView.register(dayCell.self, forCellWithReuseIdentifier: cellID)
//        
//        addSubview(dateCollectionView)
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : dateCollectionView]))
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : dateCollectionView]))
//    
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        var numbers = 0
//        if calendarData != nil {
//            numbers = calendarData.count
//        }
//        return numbers
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! dayCell
//        
//        cell.dateLable.text = calendarData[indexPath.row] as? String
//        
//        return cell
//    }
//}
//
//class dayCell: UICollectionViewCell {
//    
//    override init(frame: CGRect) {
//          super.init(frame: frame)
//          setupViews()
//      }
//      
//      required init?(coder: NSCoder) {
//          fatalError("init(coder:) has not been implemented")
//      }
//    
//    let dateLable = UILabel()
//    
//    func setupViews() {
//        
//        dateLable.frame = CGRect(x: 5, y: 5, width: 40, height: 40)
//        dateLable.textAlignment = .center
//        dateLable.textColor = Style.labelColor
//        
//        backgroundColor = .lightGray
//        self.layer.cornerRadius = 5
//        addSubview(dateLable)
//     }
//}
