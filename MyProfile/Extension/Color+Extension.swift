

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
    static let eAPP_PRIMARY_COLOR = UIColor(netHex: 0x0F62AB)
    static let eAPP_PRIMARYSHADOW_COLOR = UIColor(netHex: 0x65A2D9)

    static let eAPP_SECONDARY_COLOR = UIColor(netHex: 0x212121)

    static let eAPP_LOGO_BORDER_COLOR = UIColor(netHex: 0x0D0D0D)
    static let eAPP_SEPARATOR_COLOR  = UIColor(netHex: 0xDCDCDC)
    static let eAPP_DELETE_COLOR  = UIColor(netHex: 0xBA3B46)
    
    static let eAPP_FORM_TITLECOLOR = UIColor(netHex: 0x777777)
    static let eAPP_BORDERCOLOR = UIColor(netHex: 0xF9F9F9)
    static let eAPP_LIGHT_GRAYCOLOR = UIColor(netHex: 0xD1D1D1)
    static let eAPP_LIGHT_BADGE_GRAYCOLOR = UIColor(netHex: 0xEBEBEB)

    static let eAPP_ELLIPSE_COLOR = UIColor(netHex: 0x5ECFD2)
    static let eAPP_YELLOW_COLOR  = UIColor(netHex: 0xFDD77F)
    static let eAPP_ORANGE_COLOR  = UIColor(netHex: 0xFDA67F)

}
