//
//  SpreadsheetViewDataSource.swift
//  Smenka
//
//  Created by Viktor on 06.04.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import SpreadsheetView

extension TeamScheduleBuilderViewController: SpreadsheetViewDataSource, SpreadsheetViewDelegate {
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! SpreadsheetViewCell
        
        cell.backgroundColor = .clear
        setZeroGridlinesForCell(for: cell)
        //        setGridlinesForCell(for: cell, width: 1, color: .black)
        
        if indexPath.column == 0 && indexPath.row <= 1 {
            setLabel(label: cell.label, text: "", textAlignment: .center, fontSize: 15)
            cell.gridlines.right = .solid(width: 1, color: gridlineColor)
            if indexPath.row == 1 {
                cell.gridlines.bottom = .solid(width: 1, color: gridlineColor)
            }
        }
        
        if indexPath.column == 0 && indexPath.row > 1  {
            setLabel(label: cell.label, text: "Staff", textAlignment: .left, fontSize: 15)
            cell.gridlines.right = .solid(width: 1, color: gridlineColor)
        }
        
        if  indexPath.column == 0 && indexPath.row == testNuberOfRows - 1 {
            
            cell.label.numberOfLines = 2
            setLabel(label: cell.label, text: "The number\n of employees", textAlignment: .right, fontSize: 10)
            cell.label.layer.cornerRadius = 0
            cell.gridlines.right = .solid(width: 1, color: gridlineColor)
            cell.gridlines.top = .solid(width: 1, color: gridlineColor)
        }
        
        if  indexPath.column > 0 && indexPath.row > 1   {
            setLabel(label: cell.label, text: "12", textAlignment: .center, fontSize: 15)
            cell.label.backgroundColor = .lightGray
            cell.label.layer.cornerRadius = 12.5
        } 
        
        if  indexPath.column > 0 && indexPath.row == 0 {
            setLabel(label: cell.label, text: "\(indexPath.column)", textAlignment: .center, fontSize: 15)
        }
        
        if  indexPath.column > 0 && indexPath.row == 1 {
            setLabel(label: cell.label, text: "\(weekdays[indexPath.column - 1])", textAlignment: .center, fontSize: 15)
            cell.gridlines.bottom = .solid(width: 1, color: gridlineColor)
        }
        
        if  indexPath.column > 0 && indexPath.row == testNuberOfRows - 1 {
            setLabel(label: cell.label, text: "0", textAlignment: .center, fontSize: 15)
            cell.gridlines.top = .solid(width: 1, color: gridlineColor)
        }
        
        for index in weekendsIndexes {
            if indexPath.column == index {
                if indexPath.row <= 1 || indexPath.row == testNuberOfRows - 1 {
                    cell.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                    setGridlinesForCell(for: cell, width: 1, color: UIColor.red.withAlphaComponent(0.7))
                } else {
                    cell.backgroundColor = UIColor.red.withAlphaComponent(0.3)
                    setGridlinesForCell(for: cell, width: 1, color: UIColor.red.withAlphaComponent(0.3))
                }
            }
        }
        
        return cell
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, didSelectItemAt indexPath: IndexPath) {
        let cell = spreadsheetView.cellForItem(at: indexPath)
        
        cell?.backgroundColor = .red
        
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        if row < 2 {
            return 20
        }
        return 27
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        if column == 0 {
            return 140
        }
        return 35
    }
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return weekdays.count + 1
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return testNuberOfRows
    }
    
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 2
    }
    
    private func setGridlinesForCell(for cell: Cell,
                                     width: CGFloat,
                                     color: UIColor) {
        cell.gridlines.top = .solid(width: width, color: color)
        cell.gridlines.left = .solid(width: width, color: color)
        cell.gridlines.bottom = .solid(width: width, color: color)
        cell.gridlines.right = .solid(width: width, color: color)
    }
    
    private func setZeroGridlinesForCell(for cell: Cell) {
        cell.gridlines.top = .none
        cell.gridlines.left = .none
        cell.gridlines.bottom = .none
        cell.gridlines.right = .none
    }
    
    private func setLabel(label: UILabel, text: String, textAlignment:  NSTextAlignment, fontSize: CGFloat) {
        
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.textColor = Style.labelColor
        //        label.layer.cornerRadius = 12.5
        label.clipsToBounds = true
        label.backgroundColor = .clear
    }
    
}
