//
//  Eye.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/2/22.
//

import SwiftUI

struct Eye: View {
    var color: Color
  
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          // eyeball
          Capsule()
            .frame(width: proxy.size.width, height: proxy.size.height)
            .foregroundColor(.white)
          // iris - TODO: Draw starburst effect
          Circle()
            .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.9)
            .foregroundColor(color)
          
          // pupil
          Circle()
            .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.5)
            .foregroundColor(Color.black.opacity(0.8))
          
          // reflection 1
          let reflection1Size: CGFloat = 0.2
          let reflection2Size: CGFloat = 0.1

          Circle()
            .frame(width: proxy.size.width * reflection1Size, height: proxy.size.height * reflection1Size)
            .foregroundColor(Color.white)
            
            .offset(x: proxy.size.width * 0.1, y: -proxy.size.width * 0.1)
          
          // reflection 2
          Circle()
            .frame(width: proxy.size.width * reflection2Size, height: proxy.size.height * reflection2Size)
            .foregroundColor(Color.white)
            
            .offset(x: -proxy.size.width * 0.1, y: proxy.size.width * 0.15)
          
          Capsule().stroke(Color.black, lineWidth: 2)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Eye_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        HStack {
          Eye(color: .brown)
          Eye(color: .blue)
          Eye(color: .red)
        }
        HStack {
          Eye(color: .black)
          Eye(color: .green)
          Eye(color: .purple)
        }
        HStack {
          Eye(color: .yellow)
          Eye(color: .gray)
          Eye(color: .brown)
        }
      }
      .background(Color.gray)
    }
}
