import UIKit

public class ContentDetails: UIViewController {
    
    var dataContent: Content = Content.init(id: "", title: "", content: "", imageContent: UIImage(named: "Home_Background")!, nextClue: "")
    var colorMasking: UIColor!
    var flagging: Bool = false
    var qrData: String = ""
    
    var mainBackground: UIImageView!
    var viewContent: UIView = {
        let viewContent = UIView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        viewContent.alpha = CGFloat(0.3)
        viewContent.isOpaque = false
        viewContent.layer.cornerRadius = 10.0
        viewContent.layer.masksToBounds = true
        return viewContent
    }()
    var content: UILabel = {
        let content = UILabel(frame: CGRect(x: 230, y: 80, width: 400, height: 250))
        content.textColor = .black
        content.textAlignment = .justified
        content.numberOfLines = 0
        content.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return content
    }()
    var imageContent: UIImageView = {
        let imageContent = UIImageView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        imageContent.layer.cornerRadius = 10.0
        imageContent.layer.masksToBounds = true
        return imageContent
    }()
    var informationLabel: UILabel = {
        let informationLabel = UILabel(frame: CGRect(x: 10, y: 200, width: 200, height: 100))
        informationLabel.textColor = .black
        informationLabel.textAlignment = .justified
        informationLabel.numberOfLines = 0
        informationLabel.text = "Find out the next clue, by clicking the clue"
        informationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return informationLabel
    }()
    var goBack: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 280, width: 77, height: 78))
        button.setImage(UIImage(named: "GoBackButton"), for: .normal)
        button.isHidden = false
        return button
    }()
    
    var scanAgain: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 280, width: 77, height: 78))
        button.setImage(UIImage(named: "QR_Scan_Button"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(GoScan(_:)), for: .touchUpInside)
        return button
    }()
    
    var clueButton: UIButton = {
       let clueButton = UIButton(frame: CGRect(x: 130, y: 280, width: 77, height: 78))
       clueButton.setImage(UIImage(named: "ButtonClue"), for: .normal)
       clueButton.isHidden = false
       clueButton.addTarget(self, action: #selector(GoClue(_:)), for: .touchUpInside)
       return clueButton
    }()
    
    @objc func GoScan(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func GoClue(_ sender: UIButton) {
        let viewControllers = ClueVC()
        viewControllers.dataContent = dataContent
        viewControllers.colorMasking = colorMasking
        navigationController?.pushViewController(viewControllers, animated: true)
    }
    
    // Function to added view
    func addView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
    
        mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        guard let image  = UIImage(named: "Home_Background") else { return }
        mainBackground.image = image
        mainBackground.contentMode = .scaleToFill
        
        if flagging == true {
            goBack.addTarget(self, action: #selector(GoHome(_:)), for: .touchUpInside)
        } else {
            goBack.addTarget(self, action: #selector(GoToHome(_:)), for: .touchUpInside)
        }
        
        content.text = dataContent.content
        imageContent.image = dataContent.imageContent
        viewContent.backgroundColor = colorMasking
        
        view.addSubview(mainBackground)
        view.addSubview(content)
        view.addSubview(imageContent)
        view.addSubview(viewContent)
        view.addSubview(informationLabel)
        view.addSubview(clueButton)
        view.addSubview(goBack)
    }
    
    // Create an UIView
    func SetUpView() {
        
        if flagging == true {
            
            addView()
        
        } else {
            
            let dataQRUser = GetUserDefault()
            let countData = dataQRUser.count
            
            if countData == 0 {
                SaveUserDefault(dataQr: qrData)
                addView()
            } else if (countData == 1 && qrData == "B123") {
                SaveUserDefault(dataQr: qrData)
                addView()
            } else if (countData == 2 && qrData == "C123") {
                SaveUserDefault(dataQr: qrData)
                addView()
            } else if (countData == 3 && qrData == "M123") {
                SaveUserDefault(dataQr: qrData)
                addView()
            } else if (countData == 4 && qrData == "S123") {
                SaveUserDefault(dataQr: qrData)
                addView()
            } else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
                self.view = view
                navigationController?.isNavigationBarHidden = true
                
                mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
                guard let image  = UIImage(named: "Home_Background") else { return }
                mainBackground.image = image
                mainBackground.contentMode = .scaleToFill
                
                imageContent.image = UIImage(named: "Question")
                viewContent.backgroundColor = #colorLiteral(red: 0.6078314185, green: 0.9786804318, blue: 1, alpha: 1)
                content.text = "Sorry your answer is not match. Try to scan again and good luck"
                
                view.addSubview(mainBackground)
                view.addSubview(content)
                view.addSubview(imageContent)
                view.addSubview(viewContent)
                view.addSubview(scanAgain)
            }
        }
    }
    
    @objc func GoToHome(_ sender: UIButton) {
        let viewControllers = HomeVC()
        viewControllers.ReloadData()
        navigationController?.popToViewController(viewControllers, animated: true)
    }
    
    @objc func GoHome(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    public override func viewDidLoad() {
        
        SetUpView()
    }
    
}
