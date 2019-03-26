//
//  JoFirstViewController.swift
//  PracticePassValue
//
//  Created by 徐若芸 on 2019/3/26.
//  Copyright © 2019 Terry. All rights reserved.
//

import UIKit

class Input: NSObject {
    
    @objc dynamic var input: String = ""

}

//class SecondInput: NSObject {
//    @objc dynamic var secondInput: String
//
//    init(secondInput: String) {
//        self.secondInput = secondInput
//    }
//}

class JoFirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let fromSecond = Notification.Name(rawValue: secondVCNotificationKey)
    
    var inputObservationToken: NSKeyValueObservation?

    @objc dynamic var inputText: String?
    
    let KVOfirstInput = Input()
    
//    let KVOsecondInput = Input()
    
    @IBAction func toSecondPage(_ sender: UIButton) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "JoStoryboard", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "JoSecondViewController") as! JoSecondViewController
        
        // Property v1 -> v2
        desVC.loadViewIfNeeded()
//        desVC.label.text = textField.text
        
        // Notification v1 -> v2
//        desVC.createObserver()
//        var dict: Dictionary<String, AnyObject> = Dictionary()
        guard let firstInput = textField.text else { return }
//        dict.updateValue("\(firstInput)" as AnyObject, forKey: "FIRST")
//        let name = Notification.Name(rawValue: firstVCNotificationKey)
//        NotificationCenter.default.post(name: name, object: nil, userInfo: dict)
        
        
        // KVO
//        KVOfirstInput.addObserver(desVC, forKeyPath: "input", options: .new, context: nil)
//        KVOfirstInput.input = firstInput
//
//        desVC.KVOsecondInput2.addObserver(self, forKeyPath: "input", options: .new, context: nil)
        
//        guard inputObservationToken != nil else { return }
        
        // KVO v1 -> v2
        inputObservationToken = KVOfirstInput.observe(\.input, options: .new, changeHandler: { (object, change) in
            desVC.label.text = change.newValue
        })
        
        KVOfirstInput.input = firstInput
 
        
        // Delegate v2 -> v1
//        desVC.delegate = self
        
        
        // Closure v2 -> v1
//        desVC.onSave = onSave
        
//        desVC.onSave = { [weak self] text in
//            self?.onSave(text)
//        }
        
        desVC.onSave = { [weak self] text in
            self?.label.text = text
        }
        
        self.navigationController?.pushViewController(desVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification v2 -> v1
        //        createObserver()

        
//        observer = firstInput.observe(\.input, options: .new, changeHandler: { (objct, change) in
//            print(change.newValue)
//        })
        
    }
    
    
    // Notification v2 -> v1
//    func createObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(notifPassValue(notification:)), name: fromSecond, object: nil)
//    }
//
//    @objc func notifPassValue(notification: NSNotification) {
//        let userInfo = notification.userInfo as! Dictionary<String, AnyObject>
//
//        if let input = userInfo["SECOND"] as? String {
//            self.label.text = input
//        }
//
//    }
    

}

//extension ViewController: LabelValueDelegate {
//
//    // Delegate
//    func passValue(didGet input: String) {
//        label.text = input
//    }
//
//}




