//
//  GameViewController.swift
//  Dota2Timers
//
//  Created by влад Богдан on 27.02.16.
//  Copyright (c) 2016 влад Богдан. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds




class GameViewController: UIViewController, GADBannerViewDelegate {
    
    var bool: Bool = false;
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenRect = UIScreen.mainScreen().bounds
        
        self.bannerView = GADBannerView.init(adSize: kGADAdSizeSmartBannerPortrait)
        self.bannerView.hidden = true
        self.bannerView.adUnitID = "ca-app-pub-4528141921612904/2623911271"
        self.bannerView.rootViewController = self
        bannerView!.frame.origin.x = 0;
        bannerView!.frame.origin.y = screenRect.size.height - bannerView.frame.height;

        self.view.addSubview(self.bannerView)

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false;
            skView.showsNodeCount = false;
            skView.showsPhysics = false;
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true;
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
        
        //iAd banner
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.showBanner), name: "showBanner", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.hideBanner), name: "hideBanner", object: nil)
      
    }

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func showBanner() {
        self.bannerView.hidden = false
        let request = GADRequest()
        request.testDevices = ["2077ef9a63d2b398840261c8221a0c9b"]
        self.bannerView.loadRequest(request)
    }
    
    func hideBanner() {
        self.bannerView.hidden = true
    }
    
    func bannerView(banner: GADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView.hidden = true    }

}
