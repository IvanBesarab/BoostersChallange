//
//  AlarmViewController.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import UIKit

extension Localizable {
    static let sleepIntervalMinuteAlertButtonTitle = NSLocalizedString("%i min", comment: "<20> min")
    static let sleepIntervalSecondsAlertButtonTitle = NSLocalizedString("%i sec", comment: "<20> sec")
    static let offAlertButtonTitle = NSLocalizedString("off", comment: "off Alert Button Title")
    static let cancelAlertButtonTitle = NSLocalizedString("Cancel", comment: "Cancel")
    static let sleepTimerAlertTitle = NSLocalizedString("Sleep Timer", comment: "sleepTimerAlertTitle")
    static let alarmTimerAlertTitle = NSLocalizedString("Alarm offset timer", comment: "Alarm Alert Title")
}

class AlarmViewController: BaseViewController<AlarmViewModel>, AlarmStateDelegate {
    
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var mainButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var sleepTimerButton: UIButton!
    @IBOutlet private weak var alarmTimeButton: UIButton!
    @IBOutlet private weak var muteButton: UIButton!
    
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
        updateMuteButton()
    }
    
    @IBAction func mainButtonPressed() {
        viewModel.actionPressed()
    }
    
    @IBAction func stopButtonPressed() {
        viewModel.stopPressed()
    }
    
    @IBAction func timerAlarmPressed(_ sender: UIButton) {
        let isTimer = sender == sleepTimerButton
        let sleepIntervals: [TimeInterval] = [0, 1, 5, 10, 15, 20]//.map({ $0 * 60 }) // uncomment to convert to minutes
        let alert = UIAlertController(title: isTimer ? Localizable.sleepTimerAlertTitle : Localizable.alarmTimerAlertTitle, message: nil, preferredStyle: .actionSheet)
        sleepIntervals.forEach { (interval) in
            // Title counting
            let minCount = Int(interval / 60)
            let minutesButtonTitle = String(format: Localizable.sleepIntervalMinuteAlertButtonTitle, minCount)
            let secondsInterval = Int(interval)
            let secondsButtonTitle = secondsInterval > 0 ? String(format: Localizable.sleepIntervalSecondsAlertButtonTitle, secondsInterval) : Localizable.offAlertButtonTitle
            let buttonTitle = (isTimer ? "" : "+") + (minCount < 1 ? secondsButtonTitle : minutesButtonTitle)
            
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { [weak self] (_) in
                if isTimer {
                    self?.sleepTimerButton.setTitle(buttonTitle, for: .normal)
                    self?.viewModel.playInterval = interval
                } else {
                    self?.alarmTimeButton.setTitle(buttonTitle, for: .normal)
                    self?.viewModel.alarmDateOffset = interval
                }
            }))
        }
        alert.addAction(UIAlertAction.init(title: Localizable.cancelAlertButtonTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func muteButtonPressed(_ sender: UIButton) {
        viewModel.isMuted = !viewModel.isMuted
        updateMuteButton()
    }
    
    private func updateMuteButton() {
        muteButton.setTitle(viewModel.isMuted ? "Unmute" : "Mute", for: .normal)
    }
}
