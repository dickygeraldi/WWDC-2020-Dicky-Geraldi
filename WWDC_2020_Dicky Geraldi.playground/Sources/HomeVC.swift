import UIKit

public class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var mainBackground: UIImageView!
    var buttonScan: UIButton!
    var buttonStopMusic: UIButton!
    var buttonPlayMusic: UIButton!
    var collectedData: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        viewLayout.scrollDirection = .horizontal
        return collectionView
    }()
    
    var dataContent: [ContentTable] = []
    var detailsContent: [Content] = []
    var musicServices = MusicPlayer()
    
    
    // Function to get all data content
    func GetAllContent() -> ([ContentTable], [Content]) {
        let data = GetUserDefault()
        
        var tempContent: [ContentTable]
        var tempContentDetails: [Content]
        
        (tempContent, tempContentDetails) = GetContent(IdContent: data)
        
        return (tempContent, tempContentDetails)
    }
    
    // Create an UIView
    func SetUpView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        guard let image  = UIImage(named: "Home_Background") else { return }
        mainBackground.image = image
        mainBackground.contentMode = .scaleToFill
        
        view.addSubview(mainBackground)
        
        collectedData.frame = CGRect(x: 120, y: 120, width: 580, height: 230)
        collectedData.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectedData)
        
        (dataContent, detailsContent) = GetAllContent()
    }
    
    // Create an Stop Button
    func SetupButtonMusic(musicStatus: Bool) {
        if musicStatus == true {
            buttonStopMusic = UIButton(frame: CGRect(x: 10, y: 150, width: 77, height: 78))
            buttonStopMusic.setImage(UIImage(named: "Stop_Music"), for: .normal)
            buttonStopMusic.isHidden = false
            buttonStopMusic.addTarget(self, action: #selector(StopBackgroundMusic(_:)), for: .touchUpInside)
            view.addSubview(buttonStopMusic)
        } else {
            buttonPlayMusic = UIButton(frame: CGRect(x: 10, y: 150, width: 77, height: 78))
            buttonPlayMusic.setImage(UIImage(named: "Play_Music"), for: .normal)
            buttonPlayMusic.isHidden = false
            buttonPlayMusic.addTarget(self, action: #selector(StartBackgroundMusic(_:)), for: .touchUpInside)
            view.addSubview(buttonPlayMusic)
        }
    }
    
    // Create button
    func SetUpButtonScan() {
        buttonScan = UIButton(frame: CGRect(x: 10, y: 280, width: 77, height: 78))
        buttonScan.setImage(UIImage(named: "QR_Scan_Button"), for: .normal)
        buttonScan.addTarget(self, action: #selector(GoScan(_:)), for: .touchUpInside)
        view.addSubview(buttonScan)
    }
    
    // Function to stop background music
    @objc func StopBackgroundMusic(_ sender: UIButton) {
        musicServices.stopBackgroundMusic()
        SetupButtonMusic(musicStatus: false)
    }
    
    // Function to start again background music
    @objc func StartBackgroundMusic(_ sender: UIButton) {
        musicServices.startBackgroundMusic(sourceFile: "Sappheiros - Lights", typeFile: ".mp3")
        SetupButtonMusic(musicStatus: true)
    }
    
    // function to start scan
    @objc func GoScan(_ sender: UIButton) {
        let viewControllers = ScanQRVC()
        navigationController?.pushViewController(viewControllers, animated: true)
    }
    
    public override func viewDidLoad() {
        musicServices.startBackgroundMusic(sourceFile: "Sappheiros - Lights", typeFile: ".mp3")
        SetUpView()
        SetUpButtonScan()
        SetupButtonMusic(musicStatus: true)
        
        collectedData.register(DataCollection.self, forCellWithReuseIdentifier: "QRData")
        collectedData.dataSource = self
        collectedData.delegate = self
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func ReloadData() {
        (dataContent, detailsContent) = GetAllContent()
        collectedData.reloadData()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataContent.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QRData", for: indexPath) as! DataCollection
        
        let content = dataContent[indexPath.row]
        
        cell.dataContent = content
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewControllers = ContentDetails()
        viewControllers.dataContent = detailsContent[indexPath.row]
        viewControllers.colorMasking = dataContent[indexPath.row].colorMask
        viewControllers.flagging = true
        navigationController?.pushViewController(viewControllers, animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 400, height: 200)
    }}
