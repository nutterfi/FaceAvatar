//
//  Head.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI
import Shapes

struct Head: Shape {
  var faceRoundness: Double = 0.5

  func normalizedRoundness() -> Double {
    let oldValue = faceRoundness
    let oldMin: Double = 0
    let oldMax: Double = 1
    let newMax: Double = 179
    let newMin: Double = 61
    
    return ( (oldValue - oldMin) / (oldMax - oldMin) ) * (newMax - newMin) + newMin
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(
        Egg(apexAngle: normalizedRoundness())
          .rotation(.radians(.pi))
          .path(in: rect)
      )
    }
  }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
      Head(faceRoundness: 0.5)
        .stroke()
    }
}
