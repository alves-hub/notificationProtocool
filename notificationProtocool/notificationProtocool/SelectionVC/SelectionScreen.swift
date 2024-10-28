//
//  SelectionScreen.swift
//  notificationProtocool
//
//  Created by Jefferson Alves on 21/10/24.
//
protocol SelectionScreenProtocol: AnyObject{
    func TappedMacbookButton()
    func TappedImacButton()
}

import UIKit

class SelectionScreen: UIView {
    
    weak var delegate: SelectionScreenProtocol?
    
    public func delegate(delegate: SelectionScreenProtocol?){ 
        self.delegate  = delegate
    }
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Opções"
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        return lb
    }()
    
    lazy var macbookButton: UIButton = {
        let bt: UIButton = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        // necessario with renderMode para inserir imagem original
        bt.setImage(UIImage(named: "Image")?.withRenderingMode(.alwaysOriginal),for: .normal)
        bt.addTarget(self, action: #selector(TappedMacbookButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func TappedMacbookButton(_ sender: UIButton){
        delegate?.TappedMacbookButton()
    }
    
    lazy var imacButton: UIButton = {
        let bt: UIButton = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        // necessario with renderMode para inserir imagem original
        bt.setImage(UIImage(named: "Image 3")?.withRenderingMode(.alwaysOriginal),for: .normal)
        bt.addTarget(self, action: #selector(TappedImacButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func TappedImacButton(_ sender: UIButton){
        delegate?.TappedImacButton()
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(descriptionLabel)
        addSubview(macbookButton)
        addSubview(imacButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
    
            macbookButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 70),
            macbookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            macbookButton.heightAnchor.constraint(equalToConstant: 180),
            macbookButton.widthAnchor.constraint(equalToConstant: 250),
           
            imacButton.topAnchor.constraint(equalTo: macbookButton.bottomAnchor, constant: 50),
            imacButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            imacButton.heightAnchor.constraint(equalToConstant: 250),
            imacButton.widthAnchor.constraint(equalToConstant: 300),

        
        ])
    }
    
}
