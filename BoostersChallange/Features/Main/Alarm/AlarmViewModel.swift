//
//  AlarmViewModel.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/18/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import AVFoundation

protocol AudioDevice {
    static func create(fileName: String) -> AudioDevice
    func start()
    func pause()
    func `continue`()
    func stop()
}

protocol AlarmStateDelegate: class {
    func didChangeState(to state: AlarmState)
}

final class AlarmViewModel: BaseViewModel {
    
    private (set) var state: AlarmState = .idle {
        didSet {
            delegate?.didChangeState(to: state)
        }
    }
    
    weak var delegate: AlarmStateDelegate?
    private var device: AudioDevice!
    var timer: Timer!
    var playedInterval: TimeInterval = 0
    var playInterval: TimeInterval = 4
    var alarmFireDate: Date = Date().addingTimeInterval(8)
    
    override func viewDidLoad() {
        setupInitialState()
    }
    
    private func setupInitialState() {
        timer?.invalidate()
        device?.stop()
        state = .idle
        playedInterval = 0
        alarmFireDate = Date().addingTimeInterval(8)
        device = AVAudioPlayer.create(fileName: "nature.m4a")
    }
    
    private func switchToRecord() {
        device.stop()
        state = AVAudioSession.sharedInstance().recordPermission == .granted ? .recording : .notRecording
        guard AVAudioSession.sharedInstance().recordPermission == .granted else {
            return
        }
        device = AVAudioRecorder.create(fileName: Date().description)
        device.start()
    }
    
    private func checkPermission() {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .undetermined:
            requestRecordPermission()
        case .denied:
            state = .notRecording
        case .granted:
            switchToRecord()
        default:
            break
        }
        
    }
    
    private func requestRecordPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission() { [unowned self] allowed in
            DispatchQueue.main.async {
                self.checkPermission()
            }
        }
    }
    
    @objc func timerTicked(timer: Timer) {
        switch state {
        case .playing:
            if playedInterval < playInterval {
                playedInterval += timer.timeInterval
            }
            else {
                switchToRecord()
            }
        case .recording, .notRecording:
            if alarmFireDate.timeIntervalSinceNow < 0 {
                device.stop()
                state = .alarm
                device = AVAudioPlayer.create(fileName: "alarm.m4a")
                device.start()
            }
        default:
            break
        }
    }
    
    func actionPressed() {
        switch state {
        case .idle:
            setupInitialState() // temporary here until controlls added
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerTicked(timer:)), userInfo: nil, repeats: true)
            device.start()
            state = .playing
        case .playing, .recording:
            device.pause()
            state = .paused
        case .alarm:
            state = .idle
        case .paused:
            device.continue()
            state = .playing
        case .waitingForRecordPermission, .notRecording:
            break
        }
    }
    
    func stopPressed() {
        setupInitialState()
    }
    
}
