//
//  Specs.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/8/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit

public struct Specs {
    public struct Color{
        public let tint = UIColor(red: 160/255, green: 169/255, blue: 172/255, alpha: 1)
        public let red = UIColor.red
        public let white = UIColor.white
        public let black = UIColor.black
        public let gray = UIColor.lightGray
        public let night = UIColor(red: 41/255, green: 42/255, blue: 48/255, alpha: 1)
        public let gunGary = UIColor(red: 56/255, green: 58/255, blue: 60/255, alpha: 1)
    }
    
    public struct FontSize {
        public let tiny: CGFloat = 10
        public let small: CGFloat = 12
        public let regular: CGFloat = 14
        public let large: CGFloat = 16
    }
    
    public struct Font {
        private static let regularName = "Helvetica Neue"
        private static let boldName = "Helvetica Neue Bold"
        public let tiny = UIFont(name: regularName, size: Specs.fontSize.tiny)
        public let small = UIFont(name: regularName, size: Specs.fontSize.small)
        public let regular = UIFont(name: regularName, size: Specs.fontSize.regular)
        public let large = UIFont(name: regularName, size: Specs.fontSize.large)
        public let smallBold = UIFont(name: boldName, size: Specs.fontSize.small)
        public let regularBold = UIFont(name: boldName, size: Specs.fontSize.regular)
        public let largeBold = UIFont(name: boldName, size: Specs.fontSize.large)
        
    }
    
    public struct ImageName {
        public let friends = "fb_friends"
        public let events = "fb_events"
        public let groups = "fb_groups"
        public let education = "fb_education"
        public let townHall = "fb_town_hall"
        public let instantGames = "fb_games"
        public let settings = "fb_settings"
        public let privacyShortcuts = "fb_privacy_shortcuts"
        public let helpSupport = "fb_help_and_support"
        public let placeholder = "fb_placeholder"
    }
    
    public static var color: Color {
        return Color()
    }
    
    public static var fontSize: FontSize {
        return FontSize()
    }
    
    public static var font: Font {
        return Font()
    }
    
    public static var imageName: ImageName {
        return ImageName()
    }
}
