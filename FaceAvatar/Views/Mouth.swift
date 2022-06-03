//
//  Mouth.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI

struct Mouth: View {
    var body: some View {
      GeometryReader { proxy in
        let width = proxy.size.width
        let height = proxy.size.height
        Path { path in
          path.move(to: .zero)
          path.addQuadCurve(to: CGPoint(x: width, y: 0), control: CGPoint(x: width * 0.5, y: height * 1))
        }
        .stroke(lineWidth: 4)
      }
    }
}

struct Mouth_Previews: PreviewProvider {
    static var previews: some View {
        Mouth()
    }
}
