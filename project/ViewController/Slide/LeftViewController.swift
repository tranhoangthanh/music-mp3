//
//  LeftViewController.swift
//  project
//
//  Created by tranthanh on 4/14/20.
//  Copyright © 2020 tranthanh. All rights reserved.
//

import UIKit



class LeftViewController: UIViewController {
    
     class func newVC() -> LeftViewController {
          let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
          return storyBoard.instantiateViewController(withIdentifier: LeftViewController.className) as! LeftViewController
    }
      
     var menus = [Menu]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewMusicTitle: UIView!
   
    private var gradientLayer = CAGradientLayer()

    private var gradientApplied: Bool = false
    
    
   var item : Setting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(Colors.primaryColor)
        setupTableView()
        initMenuData()
//        getApi()
    }
    
    func getApi() {
         APIService.shared.getSettingTheme { [weak self](item) in
            if let item = item , let self = self  {
             self.item = item
               self.tableView.reloadData()
            }
        }
    }
   
    
    let musicVC = MusicViewController.newVC()
    let settingVC = SettingViewController.newVC()

    func initMenuData()  {
           let item   = Menu(id: "1", title: "Library" , icon: "icons8-headphones")
           let item2  = Menu(id: "2", title: "Theme", icon:  "icons8-t-shirt")
           let item3  = Menu(id: "3", title: "Region", icon: "icons8-folder")
           let item4  = Menu(id: "4", title: "Share" , icon: "icons8-share")
           let item5  = Menu(id: "5", title: "About us", icon:  "icons8-slider")
           let item6  = Menu(id: "6", title: "Term & Conditions", icon: "icons8-chat_room")
           menus.append(item)
           menus.append(item2)
           menus.append(item3)
           menus.append(item4)
           menus.append(item5)
           menus.append(item6)
           tableView.reloadData()
       }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.register(UINib(nibName: MenuCell.className, bundle: nil), forCellReuseIdentifier: MenuCell.className)
    }
    
     func onChangeMenu(position : Int)  {
            switch position {
            case 0:
                let navController = UINavigationController(rootViewController: musicVC)
                navController.isNavigationBarHidden = true
                slideMenuController()?.changeMainViewController(navController, close: true)
                break
            case 1:
                let bgVC = BackgroundCollectionViewController.newVC()
//                 bgVC.item = item
                self.navigationController?.pushViewController(bgVC, animated: true)
               
                break
            case 2:
                  self.showToast(message: "Coming Soon")
                break
            case 3:
                let url = "https://apps.apple.com/vn/app/graftv/id1521418243?l=vi"
                self.shareButtonClicked(url : url)
                 
            case 4:
                let url = "http://54.254.136.143/grafsound-tv/backend/web/index.php/setting/about"
                Utilities.openUrl(urlString: url)
                break
            case 5:
                let url = "http://54.254.136.143/grafsound-tv/backend/web/index.php/setting/policy"
                Utilities.openUrl(urlString: url)
        
                break
            default:
                break
            }
        }
    
   

}

extension LeftViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.className, for: indexPath) as! MenuCell
        
         cell.bind(menu: menus[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onChangeMenu(position: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let v = UIView()
           v.backgroundColor = UIColor.clear
           return v
       }

       func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 0.5
       }
    
    
}
