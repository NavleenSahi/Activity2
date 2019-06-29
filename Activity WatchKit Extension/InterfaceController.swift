//
//  InterfaceController.swift
//  Activity WatchKit Extension
//
//  Created by Navleen Sahi on 2019-06-29.
//  Copyright © 2019 Navleen. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    @IBOutlet weak var MessageLabel: WKInterfaceLabel!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    func session(_session: WCSession, didReceiveMessage message: [String : Any]) {
        // output a debug message to the terminal
        print("WATCH: Got a message!")
        
        // update the message with a label
        MessageLabel.setText("\(message)")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func WatchButtonPressed() {
        // check if the watch is paired / accessible
        if (WCSession.default.isReachable) {
            //construct the message you want to send
            // the message is in dictionary
            let msg = ["Message": "Hi"]
            // send the message to the watch
            WCSession.default.sendMessage(msg, replyHandler: nil)
        }
    }
    

}
