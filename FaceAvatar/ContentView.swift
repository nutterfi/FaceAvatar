//
//  ContentView.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
  @State private var faceRoundness = 0.5
  @State private var skinTone = Color.nutterfiSkin
  @State private var eyeColor = Color.nutterfiEye
  @State private var eyeOffsetX = 0.25
  @State private var eyeOffsetY = 0.0

  var params: AvatarParams {
    AvatarParams(
      head: HeadParams(skinTone: skinTone, faceRoundess: faceRoundness),
      eyes: EyeParams(color: eyeColor, offset: CGPoint(x: CGFloat(eyeOffsetX), y: CGFloat(eyeOffsetY)))
    )
  }
  
  var body: some View {
    VStack {
      Avatar(params: params)
      
      Spacer()
      
      HStack {
        Text("Face Roundness")
        Slider(value: $faceRoundness)
      }
      
      ColorPicker("Skin Tone", selection: $skinTone)
      
      
      HStack {
        ColorPicker("Eye Color", selection: $eyeColor)
      }
      Slider(value: $eyeOffsetX, in: 0.25...0.4)
      Slider(value: $eyeOffsetY, in: -0.5...0.5)
      
      Spacer()
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
