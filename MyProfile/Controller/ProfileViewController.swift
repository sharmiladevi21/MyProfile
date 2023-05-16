
import UIKit
import SDWebImage

enum profileDetail {
    case photo
    case name
    case email
    case mobile
    case location
    
    var titleString : String {
        switch self {
        case .photo:
            return ""
        case .name:
            return "Name"
        case .email:
            return "Email"
        case .mobile:
            return "Mobile Number"
        case .location:
            return "Location"
        }
    }
    
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lblPageTitle: UILabel!
    @IBOutlet weak var tblProfile: UITableView!
    let profileviewmodel = ProfileViewModel()
    var arrHeaderTitles = [profileDetail]()

    //MARK: - Life cycle methods
    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        loadModel()

    }
    
    //MARK: - Setup Methods
    func setUpUI(){
        profileviewmodel.delegate = self
        arrHeaderTitles = [profileDetail.photo, profileDetail.name, profileDetail.email, profileDetail.mobile,profileDetail.location]
        tblProfile.register(UINib.init(nibName: "ProfileImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileImageTableViewCell")
        tblProfile.register(UINib(nibName: "TableHeaderProfile", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "TableHeaderProfile")
        tblProfile.register(UINib.init(nibName: "CellProfileName", bundle: nil), forCellReuseIdentifier: "CellProfileName")
    

    }
    func loadModel(){
        profileviewmodel.callProfileListAPI()
    }
    
  


}

//MARK: - Tableview delegate and datasourse

extension ProfileViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrHeaderTitles.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
   
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderProfile") as! TableHeaderProfile
             header.lblTitle.text = arrHeaderTitles[section].titleString
            header.constraintLblTitleLeading.constant = 25
            return header
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if arrHeaderTitles[section] == profileDetail.photo {
            return 0
        }
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch arrHeaderTitles[section] {
            
        case profileDetail.photo, profileDetail.name, profileDetail.email,profileDetail.mobile:
            return 1
            
        case profileDetail.location:
        
            return 5
    
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch arrHeaderTitles[indexPath.section] {
            
        case profileDetail.photo:
            return 120
            
        case profileDetail.name, profileDetail.email,profileDetail.mobile,profileDetail.location:
            return 40
     
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch arrHeaderTitles[indexPath.section] {
        case profileDetail.photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell") as! ProfileImageTableViewCell
          
            if let data = profileviewmodel.getProfileData() {
                cell.configureCell(data: data)
            }
            
       
            return cell
        case profileDetail.name:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
            if let data = profileviewmodel.getProfileData() {
                cell.configureCell(displaytext: data.name.title + " " + data.name.first + " " + data.name.last, isEditable: false)

            }
            return cell
            
        case profileDetail.email:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
            if let data = profileviewmodel.getProfileData() {
                cell.configureCell(displaytext: data.email, isEditable: true)

            }
            return cell
        case profileDetail.mobile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
            if let data = profileviewmodel.getProfileData() {
                cell.configureCell(displaytext: data.cell, isEditable: true)

            }
            return cell
            
        case profileDetail.location:
            switch indexPath.row {
              case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
                if let data = profileviewmodel.getProfileData() {
                    cell.configureCell(displaytext: data.location.country, isEditable: true)

                }
                return cell
              case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
                if let data = profileviewmodel.getProfileData() {
                    cell.configureCell(displaytext: data.location.state, isEditable: true)

                }
                return cell
            case 2:
              let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
              if let data = profileviewmodel.getProfileData() {
                  cell.configureCell(displaytext: data.location.city, isEditable: true)

              }
              return cell
            case 3:
              let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
              if let data = profileviewmodel.getProfileData() {
                  cell.configureCell(displaytext: String(data.location.street.number) + "," + data.location.street.name, isEditable: true)

              }
              return cell
            case 4:
              let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfileName") as! CellProfileName
              if let data = profileviewmodel.getProfileData() {
                  cell.configureCell(displaytext: String(data.location.postcode), isEditable: true)

              }
              return cell
                
                
            default :
                return UITableViewCell()
            }
           
  
            
        }
    }
}


extension ProfileViewController : SuccessAndErrorHandling {
    func successWithData<T>(for data: T, index: Int) {
        if let data = data as? String {
            if data == ResponseType.kRESPONSE_SUCCESS{
                self.tblProfile.reloadData()

            }
        }
    }
}



