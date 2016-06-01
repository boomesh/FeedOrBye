//
//  TodayViewController.swift
//  Feed Or Bye Widget
//
//  Created by Sumesh John on 5/1/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import NotificationCenter
import FOBKit

class TodayViewController: UIViewController, NCWidgetProviding {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserverForName(FOBKit.kFullnessUpdatedNotification,
                                                                object: self,
                                                                queue: nil,
                                                                usingBlock: fullnessUpdated)
        
        NSNotificationCenter.defaultCenter().addObserverForName(FOBKit.kSayGoodbyeNotification,
                                                                object: self,
                                                                queue: nil,
                                                                usingBlock: sayGoodbye)
        
        FOBKit.fetchWatchingPets { (pets:Array<FOBPet>?) in
            print(pets)
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    // MARK:- <NSNotificationCenter>
    func fullnessUpdated(notification:NSNotification) {
        print("guh...")
    }
    
    func sayGoodbye(notification:NSNotification) {
        print("dead!")
    }
}
