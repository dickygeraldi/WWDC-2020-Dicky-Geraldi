import Foundation
import UIKit

class QRData: UIViewController {
    var data: String = ""
    var text: UILabel!
    
    func SetUpView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: 480))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        text = UILabel(frame: CGRect(x: 300, y: 300, width: 300, height: 300))
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 26.0)
        text.textAlignment = .center
        text.text = data
        
        view.addSubview(text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUpView()
    }
}
