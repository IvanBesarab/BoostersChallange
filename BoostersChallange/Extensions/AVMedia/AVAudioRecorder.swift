//
//  AVAudioRecorder.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/20/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import AVFoundation

extension AVAudioRecorder: AudioDevice {
    
    var isMuted: Bool {
        get {
            false
        }
        set {
            
        }
    }
    
    func start() {
        record()
    }
    
    func `continue`() {
        record()
    }
    
    static func create(fileName: String) -> AudioDevice {
        let fileName = Date().description + ".mp4"
        guard let documentsPathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Cannot fetch Documents dirrectory URL")
        }
        let recordPathURL = documentsPathURL.appendingPathComponent(fileName)
        do {
            let recordingSession = AVAudioSession.sharedInstance()
            try recordingSession.setCategory(.record, mode: .default, policy: .default, options: .duckOthers)
            try recordingSession.setActive(true, options: [.notifyOthersOnDeactivation])
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            let recorder = try AVAudioRecorder(url: recordPathURL, settings: settings)
            return recorder
        }
        catch {
            print(error.localizedDescription)
            fatalError(error.localizedDescription)
        }
    }
}
