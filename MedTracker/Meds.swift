//
//  Meds.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Foundation

struct Meds: Codable {
    let id: Int?
    let name: String
    let time: String

  static let all: [Meds] =  [
    Meds(id: 1, name: "Concerta 18mg", time: "9am"),
    Meds(id: 2, name: "Vitamin D", time: "8am"),
    Meds(id: 3, name: "Vitamin C", time: "8am"),
    Meds(id: 4, name: "Creatine", time: "5pm"),
    Meds(id: 5, name: "Protein Suplement", time: "5pm"),
  ]
}

//extension Meds: CustomStringConvertible {
//  var description: String {
//    return "\(name) — \(time)"
//  }
//}
