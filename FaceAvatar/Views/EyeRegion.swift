//
//  EyeRegion.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI

struct EyeRegion: View {
  var offset: CGPoint = CGPoint(x: 0.5, y: 0) // DANGEROUS
  var size: CGSize = CGSize(width: 0.2, height: 0.1)
  
  var leftEyeColor: Color = .nutterfiEye
  var rightEyeColor: Color = .nutterfiEye
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Eye(color: rightEyeColor)
          .frame(width: proxy.size.width * size.width, height: proxy.size.width * size.height)
          .offset(x: proxy.size.width * 0.5 * offset.x, y: dim * offset.y)
        
        Eye(color: leftEyeColor)
          .frame(width: proxy.size.width * 0.2, height: proxy.size.width * 0.1)
          .offset(x: -proxy.size.width * 0.5 * offset.x, y: dim * offset.y)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct EyeRegion_Previews: PreviewProvider {
    static var previews: some View {
      EyeRegion()
        .previewLayout(.sizeThatFits)
        .frame(width: 256, height: 256)
    }
}
