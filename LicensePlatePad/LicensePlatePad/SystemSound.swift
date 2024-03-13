//
//  SystemSound.swift
//  AlphaNumPad
//
//  Created by 洛格(WXL) on 2024/3/13.
//

import Foundation
import AudioToolbox
enum SystemSound: UInt32 {
    case pressClick    = 1123
    case pressDelete   = 1155
    case pressModifier = 1156
    func play() {
        AudioServicesPlaySystemSound(self.rawValue)
    }
}
