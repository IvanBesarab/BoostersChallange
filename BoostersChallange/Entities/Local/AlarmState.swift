//
//  AlarmState.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/20/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import Foundation

extension Localizable {
    static let idleStateName = NSLocalizedString("Idle", comment: "Idle State Name")
    static let playingStateName = NSLocalizedString("Playing", comment: "Playing State Name")
    static let recordingStateName = NSLocalizedString("Recording", comment: "Recording State Name")
    static let pausedStateName = NSLocalizedString("Paused", comment: "Paused State Name")
    static let alarmStateName = NSLocalizedString("Alarm", comment: "Alarm State Name")
    static let notRecordingStateName = NSLocalizedString("Not recording", comment: "Not recording State Name")
    static let waitingForRecordPermissionStateName = NSLocalizedString("Waiting For Recording Permission", comment: "Not recording State Name")
}

enum AlarmState {
    case idle
    case playing
    case recording
    case paused
    case alarm
    case notRecording
    case waitingForRecordPermission
}

extension AlarmState {
    var name: String {
        switch self {
        case .idle:
            return Localizable.idleStateName
        case .playing:
            return Localizable.playingStateName
        case .recording:
            return Localizable.recordingStateName
        case .paused:
            return Localizable.pausedStateName
        case .alarm:
            return Localizable.alarmStateName
        case .notRecording:
            return Localizable.notRecordingStateName
        case .waitingForRecordPermission:
            return Localizable.waitingForRecordPermissionStateName
        }
    }
}
