import UIKit

class DataCollection: UICollectionViewCell {
    
    var imageContent: UIImageView = {
        let imageContent = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        imageContent.layer.cornerRadius = 10.0
        imageContent.layer.masksToBounds = true
        return imageContent
    }()
    var viewContent: UIView = {
        let viewContent = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        viewContent.alpha = CGFloat(0.3)
        viewContent.isOpaque = false
        viewContent.layer.cornerRadius = 10.0
        viewContent.layer.masksToBounds = true
        return viewContent
    }()
    let titleContent: UILabel = {
        let titleContent = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        titleContent.textColor = .white
        titleContent.numberOfLines = 0
        titleContent.font = UIFont.boldSystemFont(ofSize: 26.0)
        titleContent.textAlignment = .center
        return titleContent
    }()
    
    var dataContent: ContentTable! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        imageContent.image = dataContent.imageContent
        viewContent.backgroundColor = dataContent.colorMask
        titleContent.text = dataContent.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageContent)
        addSubview(viewContent)
        addSubview(titleContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
