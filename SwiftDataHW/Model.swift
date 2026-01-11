//
//  Model.swift
//  SwiftDataHW
//
//  Created by Владимир on 11.01.2026.
//

import SwiftData
import SwiftUI

/// @Model автоматически делает структуру совместимой с хранением. SwiftData использует внутреннюю сериализацию (аналог Codable).
@Model
final class TestData {
    var text: String
    var timestamp: Date
    
    init(text: String, timestamp: Date = .now) {
        self.text = text
        self.timestamp = timestamp
    }
}
