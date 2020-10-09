//
//  Sky.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Sky {
    
    var skScene:SKScene
    
    init(for scene:SKScene) {
        self.skScene = scene
    }
    
    func createStarLayers() {
        //A layer of a star field
        let starfieldNode = SKNode()
        starfieldNode.name = "StarfieldNode"
        starfieldNode.addChild(starfieldEmitterNode(speed: -48, lifetime: skScene.size.height / 23, scale: 0.2, birthRate: 1, color: SKColor.lightGray))
        skScene.addChild(starfieldNode)

        //A second layer of stars
        var emitterNode = starfieldEmitterNode(speed: -32, lifetime: skScene.size.height / 10, scale: 0.14, birthRate: 2, color: SKColor.gray)
        emitterNode.zPosition = -10
        starfieldNode.addChild(emitterNode)

        //A third layer
        emitterNode = starfieldEmitterNode(speed: -20, lifetime: skScene.size.height / 5, scale: 0.1, birthRate: 5, color: SKColor.darkGray)
        starfieldNode.addChild(emitterNode)
        }
    
    //Creates a new star field
    func starfieldEmitterNode(speed: CGFloat, lifetime: CGFloat, scale: CGFloat, birthRate: CGFloat, color: SKColor) -> SKEmitterNode {
        let star = SKLabelNode(fontNamed: "Helvetica")
        star.fontSize = 80.0
        star.text = "✦"
        let textureView = SKView()
        let texture = textureView.texture(from: star)
        texture!.filteringMode = .nearest

        let emitterNode = SKEmitterNode()
        emitterNode.zPosition = -10
        emitterNode.particleTexture = texture
        emitterNode.particleBirthRate = birthRate
        emitterNode.particleColor = color
        emitterNode.particleLifetime = lifetime
        emitterNode.particleSpeed = speed
        emitterNode.particleScale = scale
        emitterNode.particleColorBlendFactor = 1
        emitterNode.position = CGPoint(x: skScene.frame.midX, y: skScene.frame.maxY)
        emitterNode.particlePositionRange = CGVector(dx: skScene.frame.maxX, dy: 0)
        emitterNode.particleSpeedRange = 16.0

        //Rotates the stars
        emitterNode.particleAction = SKAction.repeatForever(SKAction.sequence([
            SKAction.rotate(byAngle: CGFloat(-Double.pi/4), duration: 1),
            SKAction.rotate(byAngle: CGFloat(Double.pi/4), duration: 1)]))

        //Causes the stars to twinkle
        let twinkles = 20
        let colorSequence = SKKeyframeSequence(capacity: twinkles*2)
        let twinkleTime = 1.0 / CGFloat(twinkles)
        for i in 0..<twinkles {
            colorSequence.addKeyframeValue(SKColor.white,time: CGFloat(i) * 2 * twinkleTime / 2)
            colorSequence.addKeyframeValue(SKColor.yellow, time: (CGFloat(i) * 2 + 1) * twinkleTime / 2)
        }
        emitterNode.particleColorSequence = colorSequence

        emitterNode.advanceSimulationTime(TimeInterval(lifetime))
        return emitterNode
    }
}
