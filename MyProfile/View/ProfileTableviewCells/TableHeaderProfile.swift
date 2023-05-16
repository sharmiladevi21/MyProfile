
import UIKit

class TableHeaderProfile: UITableViewHeaderFooterView {
    @IBOutlet weak var viewHolder: UIView!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var constraintLblTitleLeading: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            viewHolder.backgroundColor = .eAPP_LIGHT_GRAYCOLOR
            lblTitle.textColor = .eAPP_FORM_TITLECOLOR
   
        
    }
}
