//
//  SporityViewController.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/9/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit

class SporityViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupVideoBackground()
    }
    
    
    func setupVideoBackground() -> Void {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
}
