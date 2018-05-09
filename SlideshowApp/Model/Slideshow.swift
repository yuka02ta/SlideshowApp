//
//  Slideshow.swift
//  SlideshowApp
//
//  Created by KawasumiYuka on 2018/05/07.
//  Copyright © 2018年 y.kawa. All rights reserved.
//

import Foundation
import UIKit

class Slideshow{
    
    /** 画像ファイル名 */
    var imgArray: [String] = ["pict1.jpg",
                              "pict2.jpg",
                              "pict3.jpg",
                              "pict4.jpg",
                              "pict5.jpg",
                              "pict6.jpg" ]
    
    var minPictCnt: Int = 0
    var maxPictCnt: Int = 0
    var playFlag: Int = 0
    var pictCnt: Int =  0
    
    /** タイマー用の変数 */
    var timer: Timer!

    init(){
        /** 初期値：停止 */
        self.playFlag = 0
        self.maxPictCnt = self.imgArray.count

        /** タイマーリセット */
        self.resetTimer()
    }
    
    /**
     * 再生停止処理
     */
    func doPlayStop(_ slideArea: UIImageView!){
        
        if playFlag == 0 {

            /** 再生処理 */
            doPlay(slideArea)
        }
        else {
            /** 再生処理 */
            doStop()
        }
    }
    
    /**
     * 再生処理
     */
    func doPlay(_ slideArea: UIImageView!){
        
        /** リセット */
        resetTimer()
        
        /** タイマー作成、始動 : 5秒ごとに呼び出す*/
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerCount(_:)), userInfo: ["slideArea" :slideArea], repeats: true)
        
        /** フラグ切り替え */
        playFlag = -1
    }
    
    /**
     * 停止処理
     */
    func doStop(){
        
        /** リセット */
        resetTimer()
        
        /** フラグ切り替え */
        playFlag = 0
    }
    
    
    /**
     * 進む処理
     */
    func doNext(){
        
        /** カウントアップ */
        countUp()
    }
    
    /**
     * 戻る処理
     */
    func doBack(){
        
        /** カウントダウン */
        countDown()
    }
    
    
    
    /**
     * カウント処理
     */
    @objc private func timerCount(_ timer: Timer!) {

        /** カウントアップ */
        countUp()
        
        /** view取得 */
        let info = timer.userInfo as! Dictionary<String, Any>
        let slideArea: UIImageView = info["slideArea"] as! UIImageView
        
        /** 画像切り替え */
        slideArea.image = UIImage(named: imgArray[self.pictCnt])
    }
    
    /**
     * カウントアップ
     */
    func countUp() {
        
        /** 1加算 */
        if pictCnt < (maxPictCnt - 1) {
            self.pictCnt += 1
        }
        else {
            self.pictCnt = minPictCnt
        }
    }
    
    /**
     * カウントダウン
     */
    private func countDown() {
        
        /** 1減算 */
        if pictCnt > minPictCnt {
            self.pictCnt -= 1
        }
        else {
            self.pictCnt = maxPictCnt - 1
        }
    }

    /**
     * リセット処理
     */
    func resetTimer() {
        
        /** タイマー破棄 */
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    /**
     * 再生停止フラグ取得
     */
    func getPlayFlag() -> Int{
        return self.playFlag
    }
    
    /**
     * ファイル名取得
     */
    func getFileName() -> String{
        return self.imgArray[self.pictCnt]
    }
    
}
