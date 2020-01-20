//
//  Localizable.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/19/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import Foundation

// (?<!(NSLocalizedString\())("[a-zA-Z0-9 ?!.,;/\-=+)(*&%#@]+") - regex pattetn to search non localizable strings

enum Localizable {
    static let stopButtonTitle = NSLocalizedString("Stop", comment: "Stop button title")
    static let startButtonTitle = NSLocalizedString("Start", comment: "Start button title")
}
