//
//  BaseViewModel.swift
//  Wealth Gap
//
//  Created by Ivan Besarab on 9/29/19.
//  Copyright © 2019 Ivan Besarab. All rights reserved.
//

import Foundation

class BaseViewModel: NSObject {

    override init() {
        print("Init of \(type(of: self))")
    }

    deinit {
        print("Deinit of \(type(of: self))")
    }

    func viewDidLoad() {
        log()
    }

    func close() {
        log()
    }
}
