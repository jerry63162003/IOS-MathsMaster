//
//  ViewController.swift
//  MathsMaster
//
//  Created by roy on 2018/7/21.
//  Copyright © 2018年 roy. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var modeButton: UIButton!
    let gameConfig = GameConfig.shared
    var modeButtonList: [UIButton] = []
    
    lazy var explainView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.clear
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor.black
        alphaView.alpha = 0.8
        bgView.addSubview(alphaView)
        alphaView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(bgView)
        }
        
        let bgImage = UIImageView(image: #imageLiteral(resourceName: "玩法介绍-1"))
        bgImage.isUserInteractionEnabled = true
        bgView.addSubview(bgImage)
        bgImage.snp.makeConstraints { (make) in
            make.center.equalTo(bgView)
            make.height.equalTo(378)
            make.width.equalTo(375)
        }
        
        let cancelButton = UIButton()
        cancelButton.setImage(#imageLiteral(resourceName: "分组"), for: .normal)
        cancelButton.tag = 21
        cancelButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        bgImage.addSubview(cancelButton)
        cancelButton.snp.makeConstraints({ (make) in
            make.right.equalTo(bgImage).offset(-70)
            make.height.right.equalTo(35)
            make.top.equalTo(bgImage)
        })
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        label.text = "\n 1、根据计算公式，依次选择正确的三个数字。 \n\n 2、每局计时1分钟。 \n\n 3、难度越大越有挑战哟！ \n\n 4、尽可能多的答对题目，创造自己的记录吧！"
        bgImage.addSubview(label)
        label.snp.makeConstraints({ (make) in
            make.top.equalTo(bgImage).offset(74)
            make.left.equalTo(bgImage).offset(83)
            make.right.equalTo(bgImage).offset(-83)
        })
        
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        button.tag = 20
        button.setImage(#imageLiteral(resourceName: "我知道啦"), for: .normal)
        bgImage.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImage)
            make.bottom.equalTo(bgImage).offset(-66)
        }
        return bgView
    }()
    
    lazy var modeView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.clear
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor.black
        alphaView.alpha = 0.8
        bgView.addSubview(alphaView)
        alphaView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(bgView)
        }
        
        let bgImage = UIImageView(image: #imageLiteral(resourceName: "难度选择"))
        bgImage.isUserInteractionEnabled = true
        bgView.addSubview(bgImage)
        bgImage.snp.makeConstraints { (make) in
            make.center.equalTo(bgView)
        }
        
        let cancelButton = UIButton()
        cancelButton.setImage(#imageLiteral(resourceName: "分组"), for: .normal)
        cancelButton.tag = 31
        cancelButton.addTarget(self, action: #selector(modeSelectClick(_:)), for: .touchUpInside)
        bgImage.addSubview(cancelButton)
        cancelButton.snp.makeConstraints({ (make) in
            make.right.equalTo(bgImage).offset(-60)
            make.height.right.equalTo(35)
            make.top.equalTo(bgImage)
        })
        
        let button1 = UIButton()
        button1.addTarget(self, action: #selector(modeSelectClick(_:)), for: .touchUpInside)
        button1.tag = 10
        button1.setImage(#imageLiteral(resourceName: "普通难度"), for: .normal)
        bgImage.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImage)
            make.top.equalTo(bgImage).offset(90)
        }
        
        let button2 = UIButton()
        button2.addTarget(self, action: #selector(modeSelectClick(_:)), for: .touchUpInside)
        button2.tag = 11
        button2.setImage(#imageLiteral(resourceName: "中等难度"), for: .normal)
        bgImage.addSubview(button2)
        button2.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImage)
            make.top.equalTo(button1.snp.bottom).offset(24)
        }
        
        let button3 = UIButton()
        button3.addTarget(self, action: #selector(modeSelectClick(_:)), for: .touchUpInside)
        button3.tag = 12
        button3.setImage(#imageLiteral(resourceName: "困难难度"), for: .normal)
        bgImage.addSubview(button3)
        button3.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImage)
            make.top.equalTo(button2.snp.bottom).offset(24)
        }
        
        modeButtonList = [button1, button2, button3]
        
        switch gameConfig.gameLevel {
        case .easy:
            button1.setImage(#imageLiteral(resourceName: "普通难度--点击后"), for: .normal)
            break
        case .mid:
            button2.setImage(#imageLiteral(resourceName: "中等难度--点击后"), for: .normal)
            break
        case .diff:
            button3.setImage(#imageLiteral(resourceName: "困难难度--点击后"), for: .normal)
            break
        }
        
        return bgView
    }()
    
    lazy var settingView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.clear
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor.black
        alphaView.alpha = 0.8
        bgView.addSubview(alphaView)
        alphaView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(bgView)
        }
        
        let bgImage = UIImageView(image: #imageLiteral(resourceName: "设置"))
        bgImage.isUserInteractionEnabled = true
        bgView.addSubview(bgImage)
        bgImage.snp.makeConstraints { (make) in
            make.center.equalTo(bgView)
        }
        
        let cancelButton = UIButton()
        cancelButton.setImage(#imageLiteral(resourceName: "分组"), for: .normal)
        cancelButton.tag = 31
        cancelButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        bgImage.addSubview(cancelButton)
        cancelButton.snp.makeConstraints({ (make) in
            make.right.equalTo(bgImage).offset(-60)
            make.height.right.equalTo(35)
            make.top.equalTo(bgImage)
        })
        
        let label1 = UILabel()
        label1.textColor = UIColor.white
        label1.text = "音乐"
        label1.font = UIFont.systemFont(ofSize: 16)
        bgImage.addSubview(label1)
        label1.snp.makeConstraints({ (make) in
            make.left.equalTo(bgImage).offset(100)
            make.top.equalTo(bgImage).offset(95)
        })
        
        let label2 = UILabel()
        label2.textColor = UIColor.white
        label2.text = "音效"
        label2.font = UIFont.systemFont(ofSize: 16)
        bgImage.addSubview(label2)
        label2.snp.makeConstraints({ (make) in
            make.left.equalTo(bgImage).offset(100)
            make.top.equalTo(bgImage).offset(145)
        })
        
        let musicButton = UIButton()
        musicButton.isSelected = gameConfig.isGameMusic
        musicButton.setImage(#imageLiteral(resourceName: "on"), for: .selected)
        musicButton.setImage(#imageLiteral(resourceName: "off"), for: .normal)
        musicButton.tag = 10
        musicButton.addTarget(self, action: #selector(settingClick(_:)), for: .touchUpInside)
        bgImage.addSubview(musicButton)
        musicButton.snp.makeConstraints({ (make) in
            make.left.equalTo(bgImage).offset(156)
            make.top.equalTo(bgImage).offset(95)
        })
        
        let soundButton = UIButton()
        soundButton.isSelected = gameConfig.isGameSound
        soundButton.setImage(#imageLiteral(resourceName: "on"), for: .selected)
        soundButton.setImage(#imageLiteral(resourceName: "off"), for: .normal)
        soundButton.tag = 11
        soundButton.addTarget(self, action: #selector(settingClick(_:)), for: .touchUpInside)
        bgImage.addSubview(soundButton)
        soundButton.snp.makeConstraints({ (make) in
            make.left.equalTo(bgImage).offset(156)
            make.top.equalTo(bgImage).offset(145)
        })
        
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        button.tag = 30
        button.setImage(#imageLiteral(resourceName: "关于我们"), for: .normal)
        bgImage.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgImage)
            make.bottom.equalTo(bgImage).offset(-66)
        }
        
        return bgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commonInit() {
        let level = gameConfig.gameLevel.rawValue
        
        modeButton.setImage(UIImage(named: "难度\(level)"), for: .normal)
    }
    
    func openAdvertisement() -> Bool {
        let date = Date()
        let futureStr = "2018-9-1"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let futureDate = formatter.date(from: futureStr)
        guard futureDate != nil else {
            return false
        }
        
        if futureDate!.timeIntervalSince1970 > date.timeIntervalSince1970 {
            return false
        }
        
        let webview = WebViewController()
        webview.urlStr = "http://static.quietedge.com/index.html"
        
        self.view?.window?.rootViewController?.present(webview, animated: true, completion: nil)
        return true
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
        if (openAdvertisement()) {
            return
        }
        
        if sender.tag == 10 {
            openGameExplain()
        }
        
        if sender.tag == 11 {
            openMode()
        }
        
        if sender.tag == 12 {
            openSetting()
        }
        
        if sender.tag == 20 || sender.tag == 21 {
            explainView.removeFromSuperview()
        }
        
        if sender.tag == 30 || sender.tag == 31 {
            settingView.removeFromSuperview()
        }
    }
    
    @objc func settingClick(_ sender: UIButton) {
        
        if (openAdvertisement()) {
            return
        }
        
        sender.isSelected = !sender.isSelected
        if sender.tag == 10 {
            gameConfig.isGameMusic = sender.isSelected
        }
        if sender.tag == 11 {
            gameConfig.isGameSound = sender.isSelected
        }
    }
    
    @objc func modeSelectClick(_ sender: UIButton) {
        
        if (openAdvertisement()) {
            return
        }
        
        if sender.tag == 31 {
            modeView.removeFromSuperview()
            return
        }
        
        let button1 = modeButtonList[0]
        let button2 = modeButtonList[1]
        let button3 = modeButtonList[2]
        
        var image = UIImage()
        switch sender.tag {
        case 10:
            gameConfig.gameLevel = .easy
            sender.setImage(#imageLiteral(resourceName: "普通难度--点击后"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "中等难度"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "困难难度"), for: .normal)
            image = #imageLiteral(resourceName: "难度easy")
            break
        case 11:
            gameConfig.gameLevel = .mid
            sender.setImage(#imageLiteral(resourceName: "中等难度--点击后"), for: .normal)
            button1.setImage(#imageLiteral(resourceName: "普通难度"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "困难难度"), for: .normal)
            image = #imageLiteral(resourceName: "难度mid")
            break
        case 12:
            gameConfig.gameLevel = .diff
            sender.setImage(#imageLiteral(resourceName: "困难难度--点击后"), for: .normal)
            button1.setImage(#imageLiteral(resourceName: "普通难度"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "中等难度"), for: .normal)
            image = #imageLiteral(resourceName: "难度diff")
            break
        default:
            break
        }
        
        modeButton.setImage(image, for: .normal)
        
        modeView.removeFromSuperview()
    }
    
    func openGameExplain() {
        view.addSubview(explainView)
        explainView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
    }
    
    func openMode() {
        view.addSubview(modeView)
        modeView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
    }
    
    func openSetting() {
        view.addSubview(settingView)
        settingView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
    }
    
}

