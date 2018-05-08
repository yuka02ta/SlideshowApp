//
//  SlidshowView.swift
//  SlideshowApp
//
//  Created by KawasumiYuka on 2018/05/08.
//  Copyright © 2018年 y.kawa. All rights reserved.
//

import UIKit

class SlideshowView: UIViewController {
    
    /**
     * 再生停止ボタンview
     */
    func viewPlayStop(_ playFlag: Int) {
        
        /** 表示変更 */
        if(playFlag == 0){
            btnPlayStop.setTitle("再生", for: UIControlState.normal)
            btnBack.isEnabled = true
            btnNext.isEnabled = true
        }else{
            btnPlayStop.setTitle("停止", for: UIControlState.normal)
            btnBack.isEnabled = false
            btnNext.isEnabled = false
        }
    }
    
    /**
     * 進む・戻るボタンview
     */
    func viewBackNext() {
        
        /** 戻るボタン */
        btnBack.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btnBack.setTitleColor(UIColor.darkGray, for: UIControlState.disabled)
        
        /** 進むボタン */
        btnNext.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btnNext.setTitleColor(UIColor.darkGray, for: UIControlState.disabled)
        
        /** topborder追加 */
        footArea.addBorderTop(height: 0.5, color: UIColor.lightGray)
    }
}
/**
* topborder追加
*/
extension UIView {
    public func addBorderTop(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}
