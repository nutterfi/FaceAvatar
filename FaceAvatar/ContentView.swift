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
  
  @State private var selectedHeadPreset: HeadPreset?
  
  @State private var headPresetViewModel = HeadPresetViewModel()

  var params: AvatarParams {
    AvatarParams(
      head: HeadParams(skinTone: skinTone, faceRoundess: faceRoundness),
      eyes: EyeParams(color: eyeColor, offset: CGPoint(x: CGFloat(eyeOffsetX), y: CGFloat(eyeOffsetY)))
    )
  }
  
  var eyeControls: some View {
    VStack {
      HStack {
        ColorPicker("Eye Color", selection: $eyeColor)
      }
      
      VStack(alignment: .leading) {
        Text("Eye position")
        HStack {
          Text("Gap Distance")
          Slider(value: $eyeOffsetX, in: 0.25...0.4) {
            Text("Gap Distance")
          } minimumValueLabel: {
            Text("")
          } maximumValueLabel: {
            Text("")
          }
          
        }
        
        HStack {
          Text("Height")
          Slider(value: $eyeOffsetY, in: -0.5...0.5) {
            Text("Height")
          } minimumValueLabel: {
            Text("")
          } maximumValueLabel: {
            Text("")
          }
        }
      }
    }
  }
  
  var facePresets: some View {
    // Face Presets
    VStack {
      Text("Face Presets")
      HStack {
        ForEach(headPresetViewModel.presets) { preset in
          EmptyView()
          VStack {
            Head(faceRoundness: preset.faceRoundness)
              .onTapGesture {
                selectedHeadPreset = preset
                faceRoundness = preset.faceRoundness
              }
              .border(selectedHeadPreset == preset ? Color.black : Color.clear)
            
            Text("\(String.init(describing: preset))")
          }
        }
      }
    }
    .border(Color.black)
  }
  
  var faceControls : some View {
    // parameters menu
    VStack {
      facePresets
      HStack {
        Text("Face Roundness")
        Slider(value: $faceRoundness)
      }
      ColorPicker("Skin Tone", selection: $skinTone)
    }
  }
  
  var body: some View {
    VStack {
      Avatar(params: params)
        
      VStack {
        faceControls
        Divider()
        eyeControls
      }
      
    }
    .padding()
    .background(Color.gray)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
