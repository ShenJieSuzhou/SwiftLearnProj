//
//  VideoCutter.swift
//  SwiftLearningDemo
//
//  Created by shenjie on 2019/9/2.
//  Copyright © 2019 shenjie. All rights reserved.
//

import UIKit
import AVFoundation

extension String{
    var convert: NSString{
        return(self as NSString)
    }
    
}

open class VideoCutter: NSObject {

    open func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat,completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?) {
    
        DispatchQueue.global().async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            
            do{
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            }catch{
                
            }
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do{
                try manager.removeItem(atPath: outputURL)
            }catch{
                
            }
            
            if let exportSession = exportSession as AVAssetExportSession?{
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4
                let start = CMTimeMakeWithSeconds(Float64(startTime), preferredTimescale: 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), preferredTimescale: 600)
                let range = CMTimeRangeMake(start: start, duration: duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously {
                    () -> Void in
                    switch exportSession.status{
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSessionStatus.failed:
//                        print("Failed:\(String(description: exportSession.error))")
                        print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(String(describing: exportSession.error))")
                    default:
                        print("default case")
                    }
                }
            }
            DispatchQueue.main.async {
                
            }
        }
    }
}
