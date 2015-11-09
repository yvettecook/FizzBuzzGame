//
//  FizzBuzzGameMemory.swift
//  FizzBuzz
//
//  Created by Yvette Cook on 09/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import Foundation

class GameMemory: NSObject {
    
    lazy var scoreStore: ScoreStore = {
        let filename = GameMemory.getDocumentsDirectory().stringByAppendingPathComponent("fizzbuzz")
        if let deCodedScoreStore = NSKeyedUnarchiver.unarchiveObjectWithFile(filename) as? ScoreStore {
            print("using stored store")
            return deCodedScoreStore
        } else {
            print("creating new store")
            return ScoreStore(scores: [], highScore: 0)
        }
    }()
    
    override init(){
        super.init()
    }
    
    func storeScore(score: Int) {
        scoreStore.storeScore(score)
    }
    
    func getHighScore() -> Int {
        return scoreStore.highScore
    }
    
    func saveScores() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(scoreStore)
        let filename = GameMemory.getDocumentsDirectory().stringByAppendingPathComponent("fizzbuzz")
        let result = data.writeToFile(filename, atomically: true)
        print("result of save: \(result)")
    }
    
    static func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}

extension String {
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
}



class ScoreStore: NSObject, NSCoding {
    
    var scores: [Int]
    var highScore : Int
    
    init(scores: [Int], highScore: Int){
        self.scores = scores
        self.highScore = highScore
    }
    
    func storeScore(score: Int) {
        scores.append(score)
        updateHighScore()
    }
    
    func updateHighScore() {
        let sortedScores = scores.sort { return $0 < $1 }
        highScore = sortedScores.last!
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard
            let scores = decoder.decodeObjectForKey("scores") as? [Int]
            else {
                print("Failed to decode score store")
                return nil
            }
        
        let highScore = decoder.decodeIntForKey("highScore")
        let scoreInt = (Int)(highScore)
        
        self.init(
            scores: scores,
            highScore: scoreInt
        )
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.scores, forKey: "scores")
        coder.encodeInteger(self.highScore, forKey: "highScore")
    }
    
}