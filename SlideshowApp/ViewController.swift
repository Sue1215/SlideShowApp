//
//  ViewController.swift
//  SlideshowApp
//
//  Created by sue on 2017/10/04.
//  Copyright © 2017年 sue. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var fowardButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    
    //画像をわかりやすく配列でまとめる
    let imageNames = ["IMG1.JPG","IMG2JPG","IMG3.JPG"]
    
    // 現在、表示すべき画像のインデックス
    var imageIndex = 0
    
    // タイマー
    var timer: Timer?
    
    // タイマーで呼び出されるメソッド
    func updateTimer() {
        print("updateTimer")
        
        imageIndex += 1
        setImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageNames [imageIndex])
    }
    
    // 進む
    @IBAction func foward(_ sender: Any) {
        imageIndex += 1
        setImage()
    }
    
    //戻る
    @IBAction func back(_ sender: Any) {
        imageIndex -= 1
        setImage()
    }
    
    //スライドショー中はボタンの操作を無効に
    //再生/停止ボタンの設定　タイマーが止まっていたら動かす、動いていたら止めるコードを追加
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            //タイマーを動かす
            self.timer = Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(updateTimer),userInfo: nil,repeats: true)
            
            //スライドショー時はボタンを停止に（こういう時はsetTitleを使う）
            playButton.setTitle("停止", for: .normal)
            // ボタンをタップ不可にする
            backButton.isEnabled = false
            fowardButton.isEnabled = false
        }
        else {
            //タイマーを止める（次にタイマーが押された時のために、timerをnilにしておく）
            self.timer?.invalidate()
            self.timer = nil
            
            //スライドショー停止時はボタンを停止に（こういう時はsetTitleを使う）
            playButton.setTitle("再生", for: .normal)
            // ボタンをタップ可にする
            backButton.isEnabled = true
            fowardButton.isEnabled = true
        }
    }
    
    //IBActionのimageIndexの値が0であること、カウントして進んだり戻ったりすることをsetImageでまとめる
    //3枚目（数値でいうと2）以降は1枚目（数値でいう0）に戻るように設定
    func setImage(){
        if imageIndex < 0 {
            imageIndex = imageNames.count - 1
        }
        
        if imageIndex > (imageNames.count - 1) {
            imageIndex = 0
        }
        
        imageView.image = UIImage(named: imageNames[imageIndex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let dViewController:DViewController = segue.destination as! DViewController
        // 遷移先のDViewControllerで宣言している画像に値を代入して渡す　画像（画像の名前が入った配列imageNamesのimageIndex番目の要素を取り出している部分）はimageNames[imageIndex]である
        dViewController.imageName = imageNames[imageIndex] //前回はresultViewController.x = 1だったところ
        
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
            playButton.setTitle("再生", for: .normal)
            // ボタンをタップ可にする
            backButton.isEnabled = true
            fowardButton.isEnabled = true
        }
        

    }
    //unwindは本当に最後に書く（{}で独立して入れば最後でなくてもいい）。何かとcontrol+クリックで繋ぐ必要なし。（Exit作成時にはそのボタンとExitの時に必要でunwindを選ぶ。）
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

