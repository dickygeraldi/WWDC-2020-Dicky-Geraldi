//
//  ContentClass.swift
//  NanoChallenge2
//
//  Created by Dicky Geraldi on 14/05/20.
//  Copyright © 2020 Dicky Geraldi. All rights reserved.
//

import UIKit

struct Content {
    var idData: String
    var title: String
    var content: String
    var imageContent: UIImage
    var nextClue: String
    
    init(id: String, title: String, content: String, imageContent: UIImage, nextClue: String) {
        self.idData = id
        self.title = title
        self.content = content
        self.imageContent = imageContent
        self.nextClue = nextClue
    }
}

struct ContentTable {
    var idData: String
    var title: String
    var imageContent: UIImage
    var colorMask: UIColor
    
    init(idData: String, title: String, colorMask: UIColor, imageContent: UIImage) {
        self.idData = idData
        self.title = title
        self.colorMask = colorMask
        self.imageContent = imageContent
    }
}

func InitContent() -> ([ContentTable], [Content]) {
    var dataContent: [Content]
    var dataTableContent: [ContentTable]
    
    let appleContent = Content.init(id: "A123", title: "Apple Fruits", content: "Apples are a type of fruit, or fruit produced from apple trees. Apples are usually red when the skin is ripe and (ready to eat), but the skin can also be green or yellow. The skin is rather soft, the flesh is hard. The fruit has few seeds in it. People first started planting apples in Central Asia. Now apples thrive in many regions of the world where temperatures are cooler. The scientific name of the apple tree in Latin is Malus domestica. Cultured apples are descended from Malus sieversii from Central Asia, with a portion of the genome from Malus sylvestris (forest apples / wild apples). Most apples are good to eat raw (uncooked), and many types of party food are also used. Apples are cooked until soft to make applesauce. Apples are also made to be apple cider drinks.", imageContent: UIImage(named: "Apple")!, nextClue: "Fruit that has many benefits. Starting from the fruit, to the branches and leaves can be used? What's is this fruit?")
    let bananaContent = Content.init(id: "B123", title: "Banana Fruits", content: "Banana is a common name given to the giant long-leaf terna plants extending from the Musaceae tribe. Several types (Musa acuminata, M. balbisiana, and M. × paradisiaca) produce consumption fruits that are named the same. This fruit is arranged in bunches with groups of fingers arranged called combs. Almost all bananas have a yellow skin when ripe, although there are some that are orange, red, green, purple, or even almost black. Banana fruit as food is a source of energy (carbohydrates) and minerals, especially potassium. Be aware, the term 'banana' is also used for a number of species that do not produce consumption fruit, such as abaca bananas, ornamental bananas, and fan bananas. This article only discusses banana-producing fruit consumption and related relatives.", imageContent: UIImage(named: "Banana")!, nextClue: "Not only preferred by children, the fruit that actually comes from mainland America is also a favorite of fruit-eating birds, such as chillies or merbah groups")
    let cherryContent = Content.init(id: "C123", title: "Cherry Fruits", content: "Cherry (Prunus subg. Cerasus) is a plant subgenus of Prunus, characterized by having small compound corymbs (not singly, or in racemes), and having smooth fruit with only a weak groove on one side, or no groove . Subgenus is a plant native to the northern hemisphere's temperate regions, with two species in America, three in Europe, and the rest in Asia. Cherry is a tree that is very popular in Japan and the flower is called sakura. In early spring, when cherry blossoms bloom, people picnic in parks where this tree is overgrown (Hanami). In Australia cherries usually mature around Christmas time, whereas in America and southern Europe in June. Production worldwide is currently three million tons per year. Besides flowers and cherries are also used as decoration food or beverage dishes. Cherries contain anthocyanins, which are red pigments that are good for health because they are antioxidants. In addition, regular consumption of cherries every day can reduce the amount of uric acid levels in the body, can even cure gout.", imageContent: UIImage(named: "Cherry")!, nextClue: "the fruit is sweet, the flesh is yellowish orange, the skin is young when green, when it is ripe yellow and has large seeds")
    let mangoContent = Content.init(id: "M123", title: "Mango Fruits", content: "Mango or dark is the name of a type of fruit, so is the name of the tree. Mango belongs to the Mangifera clan, which consists of 35-40 members from the Anacardiaceae tribe. The name 'mango' comes from the Tamil language, mankay, which means man 'mango tree' + kay 'fruit'. This word was brought to Europe by the Portuguese and absorbed into manga (Portuguese), mango (English) and others. Mango originates from the area around India's border with Burma, and it has spread to Southeast Asia for at least 1500 years ago. This fruit is also known in various regional languages, such as pelem or poh.", imageContent: UIImage(named: "Mangoo")!, nextClue: "The shape is similar to love, the color is red, like there are stripes like that, then if there's no mistaking the spots")
    let strawberryContent = Content.init(id: "S123", title: "Strawberry Fruits", content: "Strawberry or garden strawberry (also known as strawberry, from Dutch aardbei) is a strawberry variety that is most widely known in the world. Like other species in the genus Fragaria (strawberries), this fruit is in the family Rosaceae. In general, this fruit is not a fruit, but a fake fruit, meaning that the flesh of the fruit does not originate from the plant ovary (achenium) but from the bottom of the bowl-shaped hypanthium where the plant's ovaries are. Ripe strawberries Strawberry fruit is whitish green when developing, and in most species it turns red when ripe. The name comes from ancient English streawberige which is a combination of streaw or 'straw' and berige or 'berry'. The reason for giving this name is still unclear. Some Lepidoptera species take their food source from strawberry plants, making this species the main pest of strawberry plants.", imageContent: UIImage(named: "Strawberry")!, nextClue: "Congratulation you have found all the clue.")
    
    dataContent = [appleContent, bananaContent, cherryContent, mangoContent, strawberryContent]
    
    
    let appleContentTable = ContentTable.init(idData: "A123" ,title: "Apple Fruits", colorMask: #colorLiteral(red: 0.631372549, green: 0.6862745098, blue: 0.07843137255, alpha: 1), imageContent: UIImage(named: "Apple")!)
    let bananaContentTable = ContentTable.init(idData: "B123", title: "Banana Fruit", colorMask: #colorLiteral(red: 0.9098039216, green: 0.7921568627, blue: 0.2039215686, alpha: 1),imageContent: UIImage(named: "Banana")!)
    let cherryContentTable = ContentTable.init(idData: "C123", title: "Cherry Fruits", colorMask: #colorLiteral(red: 0.8039215686, green: 0.06274509804, blue: 0.1176470588, alpha: 1), imageContent: UIImage(named: "Cherry")!)
    let mangoContentTable = ContentTable.init(idData: "M123", title: "Mango Fruits", colorMask: #colorLiteral(red: 0.9960784314, green: 0.8431372549, blue: 0.2745098039, alpha: 1), imageContent: UIImage(named: "Mangoo")!)
    let strawberryContentTable = ContentTable.init(idData: "S123", title: "Strawberry Fruits", colorMask: #colorLiteral(red: 0.8431372549, green: 0.1254901961, blue: 0.1215686275, alpha: 1), imageContent: UIImage(named: "Strawberry")!)
    
    dataTableContent = [appleContentTable, bananaContentTable, cherryContentTable, mangoContentTable, strawberryContentTable]
    
    return (dataTableContent, dataContent)
}

func GetContent(IdContent: [String]) -> ([ContentTable], [Content]) {
    
    var indexed: [Int] = []
    var tempContent : [Content] = []
    var tempContentTable: [ContentTable] = []
    
    var contentAll: [Content]
    var contentTable: [ContentTable]
    (contentTable, contentAll) = InitContent()
    
    for i in 0..<IdContent.count {
        for j in 0..<contentAll.count {
            if IdContent[i] == contentAll[j].idData {
                indexed.append(j)
            }
        }
    }
    
    if indexed.count == 0 {
        let content = Content.init(id: "", title: "Still no content here, let's go and scan QR first", content: "", imageContent: UIImage(named: "Photo_None_Data")!, nextClue: "")
        let contentTable = ContentTable.init(idData: "", title: "Still no content here, let's go and scan QR first", colorMask: #colorLiteral(red: 0.937254902, green: 0.5803921569, blue: 0.9647058824, alpha: 1), imageContent: UIImage(named: "Photo_None_Data")!)
        tempContent = [content]
        tempContentTable = [contentTable]
    } else {
        for k in indexed {
            tempContent.append(contentAll[k])
            tempContentTable.append(contentTable[k])
        }
    }
    
    tempContent = contentAll
    tempContentTable = contentTable
    
    return (tempContentTable, tempContent)
}
