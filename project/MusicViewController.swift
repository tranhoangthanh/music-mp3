//
//  MusicViewController.swift
//  project
//
//  Created by tranthanh on 4/17/20.
//  Copyright © 2020 tranthanh. All rights reserved.
//

import UIKit
import Parchment


class MusicViewController: BaseViewController {
    
    
    class func newVC() ->  MusicViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier:  MusicViewController.className) as!  MusicViewController
    }
    
  
    
  
    @IBAction func close(_ sender: Any) {
        self.viewPopUp.isHidden = true
    }
    
    @IBAction func btnMenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBAction func actionSearch(_ sender: Any) {
        let search = SearchViewController.newVC()
        self.navigationController?.pushViewController(search, animated: true)
        
    }
    //
      @IBOutlet weak var viewPopUp: UIView!
    @IBOutlet weak var imgPopUp: UIImageView!
    

    var popUp : Popup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Graf TV"
        createPageMenu()
        getApi()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgPopUp.isUserInteractionEnabled = true
        imgPopUp.addGestureRecognizer(tapGestureRecognizer)
       
        
     }
    
    

     func getApi() {
          APIService.shared.getSettingTheme { [weak self](item) in
             if let item = item , let self = self  {
                self.popUp = item.popup
                if item.popup.popupImage != "" {
                     self.imgPopUp.setImage(url: item.popup.popupImage)
                } else {
                     self.viewPopUp.isHidden = true
                }
             }
         }
     }
    

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        // Your action
        let url = popUp.popupUrl
        Utilities.openUrl(urlString: url ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setBGMusic()
    }
    
   @objc func setBGMusic() {
          if let imageUrl = getImageBackGround() {
          backgroundImage.setImage(url: imageUrl)
          backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
          } else {
             backgroundImage.image = UIImage(named: "bg9")
          }
          
          self.view.insertSubview(backgroundImage, at: 0)
        
      }
        
   
    
  @IBOutlet weak var containerView: UIView!
    
    func createPageMenu(){
        let controller1  = HomeViewController.newVC()
        controller1.title = "Home"
        let controller2 = KaraokeViewController.newVC()
        controller2.title = "Karaoke"
        let controller3 = SongViewController.newVC()
        controller3.title = "My Songs"
        let controller4 = FavoriteAllVC.newVC()
        controller4.title = "Favorite"
        
        let pagingViewController = PagingViewController(viewControllers: [
            controller1 , controller2 ,controller3 , controller4
        ])
        
        
          

        
 
        
        addChild(pagingViewController)
        containerView.addSubview(pagingViewController.view)
        containerView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
       
//        
        // Customize the menu styling.
        pagingViewController.selectedTextColor = .white
        pagingViewController.textColor = .white
        pagingViewController.backgroundColor = .clear
        pagingViewController.menuBackgroundColor = .clear
        pagingViewController.selectedBackgroundColor = .clear
        pagingViewController.indicatorColor = UIColor.white
        pagingViewController.borderColor = .clear
        pagingViewController.indicatorOptions = .visible(
            height: 3,
            zIndex: Int.max,
            spacing: .zero,
            insets: .zero
        )
     }
}

