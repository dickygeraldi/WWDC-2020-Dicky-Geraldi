import UIKit

public class ClueVC: UIViewController {
    
    var mainBackground: UIImageView!
    var viewContent: UIView = {
        let viewContent = UIView(frame: CGRect(x: 10, y: 100, width: 250, height: 125))
        viewContent.alpha = CGFloat(0.3)
        viewContent.isOpaque = false
        viewContent.layer.cornerRadius = 10.0
        viewContent.layer.masksToBounds = true
        return viewContent
    }()
    var content: UILabel = {
        let content = UILabel(frame: CGRect(x: 270, y: 10, width: 300, height: 250))
        content.textColor = .black
        content.textAlignment = .justified
        content.numberOfLines = 0
        content.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return content
    }()
    var imageContent: UIImageView = {
        let imageContent = UIImageView(frame: CGRect(x: 10, y: 100, width: 250, height: 125))
        imageContent.layer.cornerRadius = 10.0
        imageContent.layer.masksToBounds = true
        return imageContent
    }()
    var goBack: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 280, width: 77, height: 78))
        button.setImage(UIImage(named: "GoBackButton"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(GoToDetailsView(_:)), for: .touchUpInside)
        return button
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
        
        content.text = dataContent.nextClue
        imageContent.image = UIImage(named: "Question")
        viewContent.backgroundColor = #colorLiteral(red: 0.6078314185, green: 0.9786804318, blue: 1, alpha: 1)
        
        view.addSubview(mainBackground)
        view.addSubview(content)
        view.addSubview(imageContent)
        view.addSubview(viewContent)
        view.addSubview(goBack)
    }
    
    @objc func GoToDetailsView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    public override func viewDidLoad() {
        SetUpView()
    }
    
}
