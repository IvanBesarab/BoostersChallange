//
//  AVAudioRecorder.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/20/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import AVFoundation

extension AVAudioRecorder: AudioDevice {
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
            fatalError(error.localizedDescription)
        }
    }
}
