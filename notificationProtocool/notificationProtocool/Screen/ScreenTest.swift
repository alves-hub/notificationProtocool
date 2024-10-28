//
//  ScreenTest.swift
//  notificationProtocool
//
//  Created by Jefferson Alves on 19/10/24.
//

import UIKit

protocol ScreenTestProtocool: AnyObject {
    func TappedChooseButton()
}

class ScreenTest: UIView {
    
    private weak var delegate: ScreenTestProtocool?
    
    
    public func delegate(delegate: ScreenTestProtocool?){
        self.delegate = delegate
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        self.addElements()
        self.configConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var logomaca: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image 2")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Teste Label"
        lb.textColor = .brown
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    lazy var chooseButton: UIButton = {
        let bt: UIButton = UIButton(type:.system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Clique Aqui", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = .white
        bt.clipsToBounds = true
        bt.layer.cornerRadius  = 3
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.addTarget(self, action: #selector(TappedChooseButton), for: .touchUpInside)
        return bt
    }()
    
    
    @objc func TappedChooseButton(_ sender: UIButton){
        
        print(#function)
        
        delegate?.TappedChooseButton()
        
    }
    
    
    public func addElements(){
        addSubview(logomaca)
        addSubview(descriptionLabel)
        addSubview(chooseButton)
    }
    
    
    public func configConstrains(){
        NSLayoutConstraint.activate([
        
            logomaca.centerXAnchor.constraint(equalTo: centerXAnchor),
            logomaca.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -70),
            logomaca.heightAnchor.constraint(equalToConstant: 200),
            logomaca.widthAnchor.constraint(equalToConstant: 160),
            
            descriptionLabel.topAnchor.constraint(equalTo: logomaca.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            //chooseButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
            chooseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            chooseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            chooseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            chooseButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
    }
    
    
    
    
}
