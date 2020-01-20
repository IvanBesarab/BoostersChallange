//
//  AlarmViewController.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import UIKit

class AlarmViewController: BaseViewController<AlarmViewModel>, AlarmStateDelegate {
    
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet  private weak var sleepTimerButton: UIButton!
    @IBOutlet private weak var alarmTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel(with: viewModel)
        setupView()
    }
    
    override func bindViewModel(with _: AlarmViewModel) {
        super.bindViewModel(with: viewModel)
        
        viewModel.delegate = self
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        mainButton.setTitle(Localizable.startButtonTitle, for: .normal)
    }
    
    func didChangeState(to state: AlarmState) {
        stateLabel.text = state.name
    }
    
    @IBAction func mainButtonPressed() {
        viewModel.actionPressed()
    }
    
    @IBAction func stopButtonPressed() {
        viewModel.stopPressed()
    }
    
}
