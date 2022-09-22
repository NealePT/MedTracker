//
//  Meds.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Foundation

struct Meds {
  let med: String
  let time: String
  
  static let all: [Meds] =  [
    Meds(med: "Concerta 18mg", time: "9am"),
    Meds(med: "Vitamin D", time: "8am"),
    Meds(med: "Vitamin C", time: "8am"),
    Meds(med: "Creatine", time: "5pm"),
    Meds(med: "Protein Suplement", time: "5pm"),
  ]
}

extension Meds: CustomStringConvertible {
  var description: String {
    return "\"\(med)\" — \(time)"
  }
}
