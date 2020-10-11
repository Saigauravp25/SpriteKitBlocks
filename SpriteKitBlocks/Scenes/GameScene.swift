//
//  GameScene.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/3/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var sky: Sky!
    var groundNode = Ground()
    var mountainNode = Mountain()
    var oceanNode = Ocean()
    var logo = Logo()
    var victoryText = Victory()
    var restartNode = Restart()
    var level: Level?
    let putDownSound = SKAction.playSoundFileNamed("putDown.wav", waitForCompletion: false)
    let floodSound = SKAction.playSoundFileNamed("flood.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.view?.showsPhysics = false
        self.backgroundColor = UIColor(hex: 0x006994) //0xB3E5FC
        self.setupNodes()
        level = Level(levelData: self.getLevelData(), for: self)
        addSwipe()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        victoryText.run(self.putDownSound)
    }
    
    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gesture.direction = direction
            self.view!.addGestureRecognizer(gesture)// self.view
        }
    }

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        let direction = sender.direction
        switch direction {
            case .right:
                _ = self.level?.movePlayer(direction: .right)
                print("Gesture direction: Right")
            case .left:
                _ = self.level?.movePlayer(direction: .left)
                print("Gesture direction: Left")
            case .up:
                print("Gesture direction: Up")
            case .down:
                _ = self.level?.playerToggleCarryLog()
                print("Gesture direction: Down")
            default:
                print("Unrecognized Gesture Direction")
        }
        let levelComplete = self.level?.checkLevelComplete()
        if levelComplete! {
            //Placeholder for now. Do action when level is complete.
            self.victoryText.drop()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "Restart" {
                self.setupNodes()
                self.oceanNode.flood()
                touchedNode.run(floodSound)
                self.logo.show()
                self.restartNode.hide()
//                self.victoryText.hide()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                    self.logo.hide()
                    self.setupNodes()
                    self.oceanNode.unflood()
                    self.restartNode.show()
                    self.level = Level(levelData: self.getLevelData(), for: self)
                }
            }
        }
    }
}

extension GameScene {
        
    func setupNodes() {
        self.removeAllChildren()
        self.sky = Sky(for: self)
        self.sky.createStarLayers()
        self.groundNode.setupGround(self)
        self.mountainNode.setupMountains(self)
        self.oceanNode.setupOcean(self)
        self.restartNode.setupRetryButton(self)
        self.logo.setupLogo(self)
        self.victoryText.setupText(self)
    }
    
    func getLevelData() -> LevelDataFormat {
        let logList: [(x: Int,y: Int)] = [(0,0),(1,0),(2,0),(2,1),(3,1),(2,3),(3,3),(3,4),(2,7),(3,7),(1,8),(2,8),(3,8),(0,9),(1,9)]
        let rockList: [(x: Int,y: Int)] = [(3,0),(2,5),(3,5),(2,9),(3,9)]
        let beaverPos: (x: Int,y: Int) = (1,5)
        let id: String = "Level 1"
        let width = 10
        let height = 4
        let levelData: LevelDataFormat = (id, width, height, logList, rockList, beaverPos)
        return levelData
    }
}
