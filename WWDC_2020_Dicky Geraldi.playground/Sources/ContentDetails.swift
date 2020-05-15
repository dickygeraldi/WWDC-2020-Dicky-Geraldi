import UIKit

public class ContentDetails: UIViewController {
    
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
        button.addTarget(self, action: #selector(GoHome(_:)), for: .touchUpInside)
        return button
    }()
    
    var clueButton: UIButton = {
       let clueButton = UIButton(frame: CGRect(x: 130, y: 280, width: 77, height: 78))
       clueButton.setImage(UIImage(named: "ButtonClue"), for: .normal)
       clueButton.isHidden = false
//       clueButton.addTarget(self, action: #selector(GoHome(_:)), for: .touchUpInside)
       return clueButton
    }()
    
    var dataContent: Content = Content.init(id: "", title: "", content: "", imageContent: UIImage(named: "Home_Background")!, nextClue: "")
    var colorMasking: UIColor!
    
    // Create an UIView
    func SetUpView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        mainBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        guard let image  = UIImage(named: "Home_Background") else { return }
        mainBackground.image = image
        mainBackground.contentMode = .scaleToFill
        
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
    
    @objc func GoHome(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    public override func viewDidLoad() {
        SetUpView()
    }
    
}
