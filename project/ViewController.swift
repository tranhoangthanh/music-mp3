//
//  ViewController.swift
//  project
//
//  Created by tranthanh on 4/11/20.
//  Copyright © 2020 tranthanh. All rights reserved.
// APPID  ca-app-pub-8105309887133821~6529376728
// UnitId ca-app-pub-8105309887133821/9882847110

import UIKit



extension UIApplication {
  
  static func mainVC() -> RootNavViewController? {
    return shared.keyWindow?.rootViewController as? RootNavViewController
  }
  
}

extension ViewController : TSSlidingUpPanelStateDelegate , TSSlidingUpPanelStateDelegate_MP3 {
    func slidingUpPanelStateChanged(slidingUpPanelNewState: SLIDE_UP_PANEL_STATE_MP3, yPos: CGFloat) {
           
       }
    func slidingUpPanelStateChanged(slidingUpPanelNewState: SLIDE_UP_PANEL_STATE, yPos: CGFloat) {
        
    }

}

class ViewController: SlideMenuController {
    var isLoading : Bool = false
  
    class func newVC() -> ViewController {
          let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
      return storyBoard.instantiateViewController(withIdentifier: ViewController.className) as! ViewController
    }
    
    
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
    }
    
//    var slidingUpVC = PlayVideoViewController.newVC()
//    var slidingUpVCAudio = PlayAudioViewController.newVC()
//    let slideUpPanelManagerVideo: TSSlidingUpPanelManager = TSSlidingUpPanelManager.with
//    let slideUpPanelManagerMp3: TSSlidingUpPanelManager_MP3 = TSSlidingUpPanelManager_MP3.with
  
//    var itemVideo =  [Video]()
//    var itemSong = [Song]()
    
     override func awakeFromNib() {
        
        let leftController =  LeftViewController.newVC()
        self.leftViewController = leftController
        
        let controller = MusicViewController.newVC()
//        let navController = UINavigationController(rootViewController: controller)
//        navController.isNavigationBarHidden = true
//
//        self.mainViewController = navController
        self.mainViewController =  controller
        super.awakeFromNib()
        
    }
    
//    func maximizePlayerDetailsVideo(item: Video?, playlistitems: [Video] = []) {
//         slideUpPanelManagerVideo.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.OPENED)
//         if item != nil {
//              slidingUpVC.item = item
//        }
//        slidingUpVC.playlistitems = playlistitems
//        slidingUpVC.prepare(true)
//        slideUpPanelManagerMp3.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE_MP3.CLOSED)
//     }
//
//    func maximizePlayerDetailsMp3(item: SongItem?, playlistitems: [SongItem] = []) {
//           slideUpPanelManagerMp3.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE_MP3.OPENED)
//            if item != nil {
//                 slidingUpVCAudio.item = item
//           }
//
//           slidingUpVCAudio.playlistitems = playlistitems
//           slidingUpVCAudio.prepare(true)
//           slideUpPanelManagerVideo.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.CLOSED)
//    }
//
//
//    func setSlidingVideo(){
//         slideUpPanelManagerVideo.slidingUpPanelStateDelegate = self
//         slideUpPanelManagerVideo.initPanelWithView(inView: view, slidingUpPanelView: slidingUpVC.view, slidingUpPanelHeaderSize: 64)
//        if slidingUpVCAudio.audioPlayer?.isPlaying == true  {
//              slideUpPanelManagerVideo.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.CLOSED)
//        } else if slidingUpVC.isPlay == false {
//             slideUpPanelManagerVideo.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.DOCKED)
//        }  else {
//            slideUpPanelManagerVideo.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.CLOSED)
//        }
//    }
//
//
//    func setSlidingMP3(){
//           slideUpPanelManagerMp3.slidingUpPanelStateDelegate_MP3 = self
//           slideUpPanelManagerMp3.initPanelWithView(inView: view, slidingUpPanelView: slidingUpVCAudio.view, slidingUpPanelHeaderSize: 64)
//           if slidingUpVCAudio.audioPlayer?.isPlaying == true {
//             slideUpPanelManagerMp3.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE_MP3.DOCKED)
//            } else {
//            slideUpPanelManagerMp3.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE_MP3.CLOSED)
//           }
//
//    }
//
//
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
//       setSlidingMP3()
//       setSlidingVideo()
     
    }
    
    deinit {
        print("Remove NotificationCenter Deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    
}



