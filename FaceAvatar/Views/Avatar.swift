//
//  Avatar.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI

struct Avatar: View {
  var params: AvatarParams
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          Head(faceRoundness: params.head.faceRoundess)
            .foregroundColor(params.head.skinTone)
            .background(Color.red)
          
          EyeRegion(
            offset: params.eyes.offset,
            leftEyeColor: params.eyes.color,
            rightEyeColor: params.eyes.color
          )
          .frame(width: dim, height: dim * 0.2)
          
          Nose()
            .frame(width: dim * 0.1, height: dim * 0.05)
            .offset(x: 0, y: dim * 0.1)
          
          Mouth()
            .frame(width: dim * 0.2, height: dim * 0.05)
            .offset(x: 0, y: dim * 0.26)
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
      Avatar(params: AvatarParams.sample)
    }
}
