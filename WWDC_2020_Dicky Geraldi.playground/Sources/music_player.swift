import Foundation
import AVFoundation

public class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    // start a background music
    public func startBackgroundMusic(sourceFile: String, typeFile: String) {

        if let soundUrI = Bundle.main.path(forResource: sourceFile, ofType: typeFile) {
            let backgroundMusic = NSURL(fileURLWithPath: soundUrI)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    // stop a background music
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
