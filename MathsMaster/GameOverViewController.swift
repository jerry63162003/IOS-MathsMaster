//
//  GameOverViewController.swift
//  MathsMaster
//
//  Created by roy on 2018/7/21.
//  Copyright © 2018年 roy. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var presonLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commonInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func commonInit() {
        scoreLabel.text = "得分: \(score)"
        
        var per = score * 2
        if per > 100 {
            per = 99
        }
        presonLabel.text = "您已超过\(per)%的挑战者，继续努力吧！"
    }
}
