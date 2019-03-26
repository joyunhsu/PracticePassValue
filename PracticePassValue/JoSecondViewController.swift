//
//  JoSecondViewController.swift
//  PracticePassValue
//
//  Created by 徐若芸 on 2019/3/26.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

let firstVCNotificationKey = "com.joyunhsu.firstVC"
let secondVCNotificationKey = "com.joyunhsu.secondVC"

protocol LabelValueDelegate: class {
    func passValue(didGet input: String)
}

class JoSecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: LabelValueDelegate?
    
    let fromFirst = Notification.Name(rawValue: firstVCNotificationKey)
    
    var onSave: ((_ data: String) -> ())?
    
    var firstInputObservationToken: NSKeyValueObservation?
    
    @IBAction func toFirstPage(_ sender: UIButton) {
        
        
        
        // Notification
        //        var dict: Dictionary<String, AnyObject> = Dictionary()
        //        guard let secondInput = textField.text else { return }
        //        dict.updateValue("\(secondInput)" as AnyObject, forKey: "SECOND")
        //        let name = Notification.Name(rawValue: secondVCNotificationKey)
        //        NotificationCenter.default.post(name: name, object: nil, userInfo: dict)
        
        // Delegate
        guard let input = textField.text else { return }
        //        delegate?.passValue(didGet: input)
        
        // Closure
        onSave?(input)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = ""
        
        
        // KVO
        
        
    }
    
    //    func createObserver() {
    //        NotificationCenter.default.addObserver(self, selector: #selector(notifPassValue(notification:)), name: fromFirst, object: nil)
    //    }
    //
    //    @objc func notifPassValue(notification: NSNotification) {
    //        let userInfo = notification.userInfo as! Dictionary<String, AnyObject>
    //
    //        if let input = userInfo["FIRST"] as? String {
    //            self.label.text = input
    //        }
    //    }
    

}
