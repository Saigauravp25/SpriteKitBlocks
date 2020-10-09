//
//  Mountain.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Mountain: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "mountainLeft")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Mountain"
        self.zPosition = -2.0
        self.anchorPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Mountain {
    
    func setupMountains(_ scene: SKScene) {
        let leftMountain = Mountain()
        let rightMountain = Mountain()
        rightMountain.xScale = -1.0
        leftMountain.position = CGPoint(x: scene.frame.size.width / 2 + 200, y: 800.0)
        rightMountain.position = CGPoint(x: scene.frame.size.width / 2 - 200, y: 800.0)
        scene.addChild(leftMountain)
        scene.addChild(rightMountain)
        
        let leftMountain2 = Mountain()
        let rightMountain2 = Mountain()
        leftMountain2.zPosition = 5.0
        rightMountain2.zPosition = 5.0
        rightMountain2.xScale = -1.0
        leftMountain2.position = CGPoint(x: scene.frame.size.width / 2, y: 600.0)
        rightMountain2.position = CGPoint(x: scene.frame.size.width / 2, y: 600.0)
        scene.addChild(leftMountain2)
        scene.addChild(rightMountain2)
        
//        for i in -1...1 {
//            let ground = Ground()
//            ground.position = CGPoint(x: CGFloat(i) * ground.frame.size.width, y: 390.0)
//            scene.addChild(ground)
//        }
    }
}
