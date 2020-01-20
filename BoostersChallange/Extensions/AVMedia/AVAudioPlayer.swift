//
//  AVAudioPlayer.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/20/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import AVFoundation

extension AVAudioPlayer: AudioDevice {
    
    var isMuted: Bool {
        get {
            return self.volume <= 0
        }
        set {
            volume = newValue ? 0 : 1
        }
    }
    
    func start() {
        play()
    }
    
    func `continue`() {
        play()
    }
    
    static func create(fileName: String) -> AudioDevice {
        let fileNameComponents = fileName.components(separatedBy: ".")
        guard let name = fileNameComponents.first, let extention = fileNameComponents.last, fileName != extention else {
            fatalError("Wrong provided filename")
        }
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: extention) else {
            fatalError("Something wrong with file")
        }
        do {
            let recordingSession = AVAudioSession.sharedInstance()
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            
            let player = try AVAudioPlayer(contentsOf: fileURL)
            player.numberOfLoops = -1
            return player
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
}
