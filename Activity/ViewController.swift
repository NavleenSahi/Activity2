//
//  ViewController.swift
//  Activity
//
//  Created by Navleen Sahi on 2019-06-29.
//  Copyright © 2019 Navleen. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @IBOutlet weak var Outpulabel: UILabel!
    
    func session(_session: WCSession, didRecieveMessage message: [String : Any]) {
        print("phone got a message")
        Outpulabel.text = message["message"] as? String
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (WCSession.isSupported()) {
            print("PHONE: Phone supports WatchConnectivity!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
            
        else {
            print("PHONE: Phone does not support WatchConnectivity!")
        }
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        
        if (WCSession.default.isReachable) {
          
            let message = ["Message": "Hello"]
           
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
    }
    
}

