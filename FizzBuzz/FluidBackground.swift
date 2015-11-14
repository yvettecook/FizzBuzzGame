////
////  FluidBackground.swift
////  FizzBuzz
////
////  Created by Yvette Cook on 12/11/2015.
////  Copyright © 2015 YvetteCook. All rights reserved.
////
//
//import Foundation
//
//class FluidView: UIView {
//    
//    var rootView : UIView
//    var lineLayer : CAShapeLayer
//
//    var amplitudeArray : []
//    var startingAmplitude : Int
//    
//    var startElevation : NSNumber
//    var primativeStartElevation : Double
//    
//    var fillLevel : NSNumber
//    var initialFill : Bool
//    
//    var animating : Bool
//    
//    var waveLength : Int
//    var finalX : Int
//    
//    // MARK: Lifecycle
//    
//    func initWithFrame(rect: CGRect, maxAmplitude: Int, minAmplitude: Int, amplitudeIncrement: Int) {
//        self = super.initWithFrame(rect)
//        
//        if self {
//            self.initalise
//            self.maxAmplitude = maxAmplitude
//            self.minAmplitude = minAmplitude
//            self.amplitudeIncrement = amplitudeIncrement
//            self.amplitudeArray = self.createAmplitudeOptions()
//        }
//        
//        return self
//    }
//    
//}
