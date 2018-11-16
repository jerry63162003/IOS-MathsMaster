//
//  SoundManager.swift
//  MathsMaster
//
//  Created by roy on 2018/7/26.
//  Copyright © 2018年 roy. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class SoundManager: NSObject {
    //申明一个播放器
    var bgMusicPlayer = AVAudioPlayer()
    //播放点击的动作音效
    lazy var hitAct: AVAudioPlayer = {
        let bgMusicURL =  Bundle.main.url(forResource: "win", withExtension: "mp3")!
        let winMusic = try! AVAudioPlayer(contentsOf: bgMusicURL)
        //设置为循环播放
        winMusic.numberOfLoops = 0
        //准备播放音乐
        winMusic.prepareToPlay()
        
        return winMusic
    }()
    
    //播放背景音乐的音效
    func playBackGround(){
        print("开始播放背景音乐!")
        //获取bg.mp3文件地址
        let bgMusicURL =  Bundle.main.url(forResource: "bg", withExtension: "mp3")!
        //根据背景音乐地址生成播放器
        try! bgMusicPlayer = AVAudioPlayer (contentsOf: bgMusicURL)
        //设置为循环播放(
        bgMusicPlayer.numberOfLoops = -1
        //准备播放音乐
        bgMusicPlayer.prepareToPlay()
        //播放音乐
        bgMusicPlayer.play()
    }
    
    //播放点击音效动作的方法
    func playHit(){
        hitAct.play()
    }
}
