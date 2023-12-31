import UIKit

public struct MonsterProductInfo {
    public let image: UIImage
    public let name: String
    public let description: String
    public let price: String

    public init(image: UIImage, name: String, description: String, price: String) {
        self.image = image
        self.name = name
        self.description = description
        self.price = price
    }
}
