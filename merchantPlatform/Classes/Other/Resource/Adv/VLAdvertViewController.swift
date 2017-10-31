//
//  VLAdvertViewController.swift
//  merchantPlatform
//
//  Created by dinpay on 2017/10/31.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

private let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width
private let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height

class VLAdvertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.view.backgroundColor = UIColor.red
        
        showLocalAnimation()
    }
    
    // MARK:- 加载动画
    func showLocalAnimation() {
        
        // 设置背景图片
        let frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        let bgImageView = UIImageView(frame: frame)
        bgImageView.image = UIImage(named: "launch")
        self.view.addSubview(bgImageView)
        
        // 获取路径
        let path = Bundle.main.path(forResource: "CN", ofType: "m4v")
        if path == nil  {
            return
        }
        let url = URL(fileURLWithPath: path!)
        
        let player : AVPlayerViewController = AVPlayerViewController()
        player.player = AVPlayer(url: url)
//        player.movieSourceType = .file
        player.view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        player.view.center = CGPoint(x: kScreenWidth * 0.5, y: kScreenHeight * 0.25)
//        player.repeatMode = .none
//        player.controlStyle = .none
        player.view.backgroundColor = UIColor.white
//        player.backgroundView.backgroundColor = UIColor.white
        
        player.view.layer.cornerRadius = 4.0
        player.view.clipsToBounds = true
//        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackDidFinish), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: player)
        
        self.view.addSubview(player.view)
        player.player?.play()
    }
    

    @objc func moviePlayBackDidFinish() {
        print("播放完成")
    }

}
