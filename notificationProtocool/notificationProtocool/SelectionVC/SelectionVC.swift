//
//  SelectionVCViewController.swift
//  notificationProtocool
//
//  Created by Jefferson Alves on 21/10/24.
//

import UIKit

class SelectionVC: UIViewController {

    var selectionScreen: SelectionScreen?

    override func loadView() {
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectionScreen?.delegate(delegate: self)
        
    }
    
}

extension SelectionVC: SelectionScreenProtocol {
    func TappedMacbookButton() {
        print("Opa passou na SelectionVC")
        NotificationCenter.default.post(name: Notification.Name("macbook"), object: UIColor.green)
        dismiss(animated: true)
     
    }
    
    func TappedImacButton() {
        print("Opa passou na SelectionVC")
        NotificationCenter.default.post(name: Notification.Name("imac"), object: UIColor.red)
        dismiss(animated: true)
        
    }
    
    
}
