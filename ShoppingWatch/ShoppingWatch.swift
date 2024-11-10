//
//  ShoppingWatch.swift
//  ShoppingWatch
//
//  Created by Maria Luísa Costa Pinto on 17/09/24.
//

import AppIntents

struct ShoppingWatch: AppIntent {
  static var title: LocalizedStringResource = "ShoppingWatch"

  func perform() async throws -> some IntentResult {
    return .result()
  }
}
