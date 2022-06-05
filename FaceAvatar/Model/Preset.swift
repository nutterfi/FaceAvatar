//
//  Preset.swift
//  FaceAvatar
//
//  Created by nutterfi on 6/4/22.
//

import Foundation

/// what does a head preset contain?
/// - faceRoundesss
///
/// what about eyes?
/// - color
/// - gap 

/// a stored set of parameters
protocol Presettable {
  var numberOfPresets: Int { get }
  func load(index: Int) -> Preset?
}

struct Preset: Identifiable {
  var id: String // a particular feature, e.g. "Face" or "Nose"
  var value: [Presettable]
}

// my models are the enums themselves
enum EyePreset: CaseIterable, Identifiable {
  var id: Self { self }

  case wide
  case narrow
  case droopy
  case closed
  case scared
  case evil
  case squinting
  
  var gap: Double {
    switch self {
    case .wide:
      return 0.5
    case .narrow:
      return 0.2
    case .droopy:
      return 0.1
    case .closed:
      return 0.25
    case .scared:
      return 0.21
    case .evil:
      return 0.666
    case .squinting:
      return 0.01
    }
  }
}

enum HeadPreset: CaseIterable, Identifiable {
  var id: Self { self }
  
  case sporty
  case spicy
  case stoic
  case sumo
  case salacious
  
  var faceRoundness: Double {
    switch self {
    case .stoic:
      return 0.5
    case .salacious:
      return 0.0
    case .spicy:
      return 0.733
    case .sumo:
      return 1
    case .sporty:
      return 0.42
    }
  }
}

struct HeadPresetViewModel {
  
  var numberOfPresets: Int {
    return HeadPreset.allCases.count
  }
  
  let presets: [HeadPreset] = HeadPreset.allCases
  
  func load(index: Int) -> Any? {
    guard index < numberOfPresets else { return nil }
    return presets[index]
  }
}
