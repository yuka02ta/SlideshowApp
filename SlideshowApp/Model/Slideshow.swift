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

    /**
     * イニシャライザ
     */
    init(){
        /** 初期値：停止 */
        self.playFlag = 0
        self.maxPictCnt = self.imgArray.count
        
        /** タイマーリセット */
        self.resetTimer()
    }
    
    /**
     * 初期処理
     */
    func doInit(_ slideArea: UIImageView!){
        
        /** セット*/
        slideArea.image = UIImage(named: imgArray[minPictCnt])
    }
    
    /**
     * 再生停止処理
     */
    func doPlayStop(_ slideArea: UIImageView!){
        
        /** リセット */
        resetTimer()
        
        /** 停止→再生 */
        if playFlag == 0 {

            /** 再生処理 */
            stretTimer(slideArea)
            
            /** フラグ切り替え */
            playFlag = -1
        }
        
        /** 再生→停止 */
        else {

            /** フラグ切り替え */
            playFlag = 0
        }
    }
    
    /**
     * 進む処理
     */
    func doNext(_ slideArea: UIImageView!){
        
        /** カウントアップ */
        countUp()
        
        /** 画像切り替え */
        slideArea.image = UIImage(named: imgArray[self.pictCnt])
    }
    
    /**
     * 戻る処理
     */
    func doBack(_ slideArea: UIImageView!){
        
        /** カウントダウン */
        countDown()
        
        /** 画像切り替え */
        slideArea.image = UIImage(named: imgArray[self.pictCnt])
    }
    
    
    /**static
     * 再生処理
     */
    private func stretTimer(_ slideArea: UIImageView!) {
        
        /** タイマー作成、始動 : 5秒ごとに呼び出す*/
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerCount(_:)), userInfo: ["slideArea" :slideArea], repeats: true)
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
    private func countUp() {
        
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
    private func resetTimer() {
        
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
     * 表示ファイル名取得
     */
    func getFileName() -> String{
        return self.imgArray[self.pictCnt]
    }
}
