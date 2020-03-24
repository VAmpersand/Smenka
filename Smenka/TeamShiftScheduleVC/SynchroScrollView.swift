//
//  SynchroScrollView.swift
//  Smenka
//
//  Created by Viktor on 24.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class SynchroScrollView: UIScrollView {
    var synchronizedScrollView = UIScrollView()

    func setSynchronizedScrollView(scrollview: UIScrollView)
    {
        self.stopSynchronizing()
    
        synchronizedScrollView = scrollview
    
        var synchronizedContentView = UIView()
        synchronizedContentView = synchronizedScrollView.superview!
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(synchronizedViewContentBoundsDidChange), name: NSNotification.Name(rawValue: "scroll"), object: synchronizedContentView)
    }
    
    @objc func synchronizedViewContentBoundsDidChange(_ notification: Notification)
    {
        let changedContentView = notification.object
        let changedBoundsOrigin = (changedContentView as AnyObject).contentOffset
    
        let curOffset = self.contentOffset
        var newOffset = curOffset
    
        newOffset.y = (changedBoundsOrigin?.y)!
    
        if curOffset != changedBoundsOrigin! {
             self.setContentOffset(newOffset, animated: true)
//            self.reflectScrolledClipView(self.contentView)
        }
    }

     func stopSynchronizing()
    {
        if synchronizedScrollView.isEqual(nil) == false
        {
            let synchronizedContentView = synchronizedScrollView.superview!
        
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "scroll"), object: synchronizedContentView)
        synchronizedScrollView = UIScrollView()
        }
    }
}
