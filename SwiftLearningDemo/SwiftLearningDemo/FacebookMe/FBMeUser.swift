//
//  FBMeUser.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/8/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit

class FBMeUser{
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "steve jobs", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
