import UIKit
import PlaygroundSupport
import AVFoundation

class ViewControllers: UIViewController {
    
    var mainBackground: UIImageView!
    var buttonPlay: UIButton!
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
    
    //create an UIView
    func SetUpView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        guard let image  = UIImage(named: "Main_background") else { return }
        mainBackground.image = image
        mainBackground.contentMode = .scaleAspectFit
        
        view.addSubview(mainBackground)
    }
    
    // Create button
    func SetUpButton() {
        buttonPlay = UIButton(frame: CGRect(x: 260, y: 150, width: 89, height: 108))
        buttonPlay.setImage(UIImage(named: "Play_Button"), for: .normal)
        view.addSubview(buttonPlay)
    }
    
    // function if button play tap
    @objc func GoPlay(_ sender: UIButton) {
        let viewControllers = HomeVC()
        stopBackgroundMusic()
        navigationController?.pushViewController(viewControllers, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpView()
        SetUpButton()
        startBackgroundMusic(sourceFile: "Sappheiros - Lights", typeFile: ".mp3")
        
        buttonPlay.addTarget(self, action: #selector(GoPlay(_:)), for: .touchUpInside)
    }
}

let viewControllers = ViewControllers()
let navigationController = UINavigationController(rootViewController: viewControllers)
viewControllers.preferredContentSize = CGSize(width: 660, height: 480)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = navigationController
