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
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        
        cell.gridlines.top = .solid(width: 1, color: .blue)
        cell.gridlines.left = .solid(width: 1, color: .blue)
        cell.gridlines.bottom = .solid(width: 1, color: .blue)
        cell.gridlines.right = .solid(width: 1, color: .blue)
        
        return cell
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, didSelectItemAt indexPath: IndexPath) {
        let cell = spreadsheetView.cellForItem(at: indexPath)
        
        cell?.backgroundColor = .red
        
        
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        if row == 0 {
            return 50
        }
        return 30
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        if column == 0 {
            return 150
        }
        return 45
    }
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 32
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 17
    }
    
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
    
    
    
}
