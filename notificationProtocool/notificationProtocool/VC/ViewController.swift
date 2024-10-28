//
//  ViewController.swift
//  notificationProtocool
//
//  Created by Jefferson Alves on 19/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var screentest: ScreenTest?
    
    override func loadView() {
        screentest = ScreenTest()
        view = screentest
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screentest?.delegate(delegate: self)
        self.configObservador()
        
    }
    
    public func configObservador(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac), name: Notification.Name("imac"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook), name: Notification.Name("macbook"), object: nil)
        
    }
    
    @objc func updateImac(notification: NSNotification){
        view.backgroundColor = notification.object as? UIColor
        screentest?.descriptionLabel.text = "IMAC NAVE DEMAIS"
        screentest?.descriptionLabel.textColor = .black
        screentest?.logomaca.image = UIImage(named: "Image 4")
        
    }
    
    @objc func updateMacbook(nofitication: NSNotification){
        view.backgroundColor = nofitication.object as? UIColor
        screentest?.descriptionLabel.text = "MACBOOK TOPZERA"
        screentest?.descriptionLabel.textColor = .black
        screentest?.logomaca.image = UIImage(named: "Image")
    }


}

extension ViewController: ScreenTestProtocool {
    
    
    func TappedChooseButton() {
        
        print("Opa passou pela View Controller")
        let vc = SelectionVC()
        present(vc, animated: true)
        
        //navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
