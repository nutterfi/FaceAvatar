//
//  AvatarParams.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import Foundation
import SwiftUI

struct AvatarParams {
  var head: HeadParams
  var eyes: EyeParams
}

extension AvatarParams {
  static let sample = AvatarParams(
    head: HeadParams(skinTone: .nutterfiSkin, faceRoundess: 0.5),
    eyes: EyeParams(color: .nutterfiEye)
  )
}

struct EyeParams {
  var color: Color
  var offset: CGPoint = CGPoint(x: 0.25, y: 0)
}

struct NoseParams {
  
}

struct HeadParams {
  var skinTone: Color
  var faceRoundess: Double
}

