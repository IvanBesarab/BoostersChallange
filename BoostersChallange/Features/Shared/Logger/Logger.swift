//
//  Logger.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import Foundation

func log(_ functionName: String = #function, line: Int = #line, file: String = #file, message: String = "") {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    print("\(dateFormatter.string(from: Date())) l#:\(line) \(functionName) in \((file as NSString).lastPathComponent) " + message)
}
