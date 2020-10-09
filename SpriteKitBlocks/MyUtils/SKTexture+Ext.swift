////
////  SKTexture+Ext.swift
////  SpriteKitBlocks
////
////  Created by Saigaurav Purushothaman on 10/8/20.
////
//
//import SpriteKit
//
//extension SKTexture {
//    class func flipImage(name:String,flipHoriz:Bool,flipVert:Bool)->SKTexture {
//        if !flipHoriz && !flipVert {
//            return SKTexture.init(imageNamed: name)
//        }
//        let image = UIImage(named:name)
//
//        UIGraphicsBeginImageContext(image!.size)
//        let context = UIGraphicsGetCurrentContext()
//
//        if !flipHoriz && flipVert {
//            // Do nothing, X is flipped normally in a Core Graphics Context
//            // but in landscape is inverted so this is Y
//        } else
//        if flipHoriz && !flipVert{
//            // fix X axis but is inverted so fix Y axis
//            context!.translateBy(x: 0, y: image!.size.height)
//            context!.scaleBy(x: 1.0, y: -1.0)
//            // flip Y but is inverted so flip X here
//            context!.translateBy(x: image!.size.width, y: 0)
//            context!.scaleBy(x: -1.0, y: 1.0)
//        } else
//        if flipHoriz && flipVert {
//            // flip Y but is inverted so flip X here
//            context!.translateBy(x: image!.size.width, y: 0)
//            context!.scaleBy(x: -1.0, y: 1.0)
//        }
//
//        CGContextDrawImage(context, CGRectMake(0.0, 0.0, image!.size.width, image!.size.height), image!.cgImage)
//
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext();
//        return SKTexture(image: newImage)
//    }
//}
