//
//  Logo.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Logo: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "damItLogo")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Logo"
        self.zPosition = 4.0
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Logo {
    
    func setupLogo(_ scene: SKScene) {
        self.position = CGPoint(x: scene.frame.size.width / 2, y: scene.frame.size.height / 3)
        scene.addChild(self)
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
