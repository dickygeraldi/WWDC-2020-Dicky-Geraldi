import UIKit

struct Content {
    var title: String
    var content: String
    var imageContent: UIImage
    
    init(title: String, content: String, imageContent: UIImage) {
        self.title = title
        self.content = content
        self.imageContent = imageContent
    }
}

struct ContentTable {
    var title: String
    var imageContent: UIImage
    var briefDetails: String
    
    init(title: String, briefDetails: String, imageContent: UIImage) {
        self.title = title
        self.briefDetails = briefDetails
        self.imageContent = imageContent
    }
}

