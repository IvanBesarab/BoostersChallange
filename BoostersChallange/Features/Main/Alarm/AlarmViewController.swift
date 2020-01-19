//
//  AlarmViewController.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import UIKit

class AlarmViewController: BaseViewController<AlarmViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
