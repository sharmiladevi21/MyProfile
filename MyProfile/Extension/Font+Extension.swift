
import UIKit


extension UIFont {

    static func AvenirBoldFont (size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size) ?? self.boldSystemFont(ofSize: size)
    }
    static func AvenirMediumFont (size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size) ?? self.boldSystemFont(ofSize: size)
    }
    static func AvenirRegularFont (size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? self.boldSystemFont(ofSize: size)
    }
    static func AvenirMediumLightFont (size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Roman", size: size) ?? self.boldSystemFont(ofSize: size)
    }
    static func QuickSandRegularFont (size: CGFloat) -> UIFont {
        return UIFont(name: "Quicksand-Light", size: size) ?? self.boldSystemFont(ofSize: size)
    }
}

