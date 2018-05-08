//
//  SlideshowController.swift
//  SlideshowApp
//
//  Created by KawasumiYuka on 2018/04/27.
//  Copyright © 2018年 y.kawa. All rights reserved.
//

import UIKit

class SlideshowController: UIViewController {
    
    @IBOutlet weak var slideArea: UIImageView!
    @IBOutlet weak var btnPlayStop: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var footArea: UIView!
    
    /** モデル */
    let slideshow: Slideshow? = Slideshow()
    var playFlag: Int = 0
    
    /**
     * viewDidLoad
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** 初期処理 */
        slideshow!.doInit(slideArea)
        
        /** 再生停止ボタン */
        playFlag = slideshow!.getPlayFlag()
        
        /** view */
        viewPlayStop(playFlag)
        viewBackNext()
    }

    /**
     * didReceiveMemoryWarning
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * 再生停止押下
     */
    @IBAction func actionPlay(_ sender: Any) {
        
        /** 再生停止処理 */
        slideshow!.doPlayStop(slideArea)
        
        /** 再生停止ボタン */
        playFlag = slideshow!.getPlayFlag()
        viewPlayStop(playFlag)
    }
    
    /**
     * 進む押下
     */
    @IBAction func actionNext(_ sender: Any) {
        
        /** 進む処理 */
        slideshow!.doNext(slideArea)
    }
    
    /**
     * 戻る押下
     */
    @IBAction func actionBack(_ sender: Any) {
        
        /** 戻る処理 */
        slideshow!.doBack(slideArea)
    }
    
    /**
     * 画像押下
     */
    @IBAction func actionImage(_ sender: Any) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "pict")
        
        /** delegateにファイル名セット */
        appDelegate.pictName = slideshow!.getFileName()
        present(nextVC!, animated:false, completion: nil)
    }
    
    /**
     * 結果画面遷移前処理
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pictCtrl: PictController = segue.destination as! PictController
        
        /** 値セット */
        pictCtrl.pictName = slideshow!.getFileName()
    }
    
    /**
     * 戻ってきた時処理
     */
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
    }
    
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
    func addBorderTop(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}

