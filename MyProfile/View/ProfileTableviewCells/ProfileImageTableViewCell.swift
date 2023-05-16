
import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImgTips: UILabel!
    @IBOutlet weak var lblProfileName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(data : Result){
        btnUpload.setTitle("Upload photo", for: .normal)
        Helper.sharedInstance.setRoundCornerView(aView: imgView)
        imgView.contentMode = .scaleAspectFit
        
        let profileUrl = data.picture.medium
        if URL.init(string: profileUrl) != nil{
           imgView.sd_setImage(with: URL(string: profileUrl)!)
           lblProfileName.isHidden = true
        } else {
           imgView.image = nil
           lblProfileName.isHidden = false
           lblProfileName.text = data.name.first + data.name.last
        }

    }
}
