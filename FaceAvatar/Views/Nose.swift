//
//  Nose.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI

struct Nose: View {
  var body: some View {
    
    GeometryReader { proxy in
      let width = proxy.size.width
      let height = proxy.size.height
      Path { path in
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addQuadCurve(to: CGPoint(x: width * 0.5, y: height), control: CGPoint(x: width * 0.1, y: height * 0.5))
      }
      .stroke(lineWidth: 2)
    }
    
  }
}

struct Nose_Previews: PreviewProvider {
  static var previews: some View {
    Nose()
  }
}
