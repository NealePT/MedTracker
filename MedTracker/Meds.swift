//
//  Meds.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Foundation

struct Meds: Codable {
  let name: String
  let time: String

  static let all: [Meds] =  [
    Meds(name: "Concerta 18mg", time: "9am"),
    Meds(name: "Vitamin D", time: "8am"),
    Meds(name: "Vitamin C", time: "8am"),
    Meds(name: "Creatine", time: "5pm"),
    Meds(name: "Protein Suplement", time: "5pm"),
  ]
}

//extension Meds: CustomStringConvertible {
//  var description: String {
//    return "\(name) — \(time)"
//  }
//}
