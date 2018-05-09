//
//  PictController.swift
//  SlideshowApp
//
//  Created by KawasumiYuka on 2018/04/27.
//  Copyright © 2018年 y.kawa. All rights reserved.
//

import UIKit

class PictController: UIViewController{
    
    @IBOutlet weak var imageViews: UIImageView!
    
     var pictName: String? = nil
    
    /**
     * viewDidLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** 画像表示 */
        showpict()
    }

    /**
     * didReceiveMemoryWarning
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * 画像表示
     */
    func showpict() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        /** ファイル名取得 */
        self.pictName = appDelegate.pictName
        
        /** 画像セット */
        if let pictName = self.pictName {
            imageViews.image = UIImage(named: pictName)
        }
    }
}
