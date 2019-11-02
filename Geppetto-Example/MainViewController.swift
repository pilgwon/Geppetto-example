//
//  MainViewController.swift
//  Geppetto-Example
//
//  Created by PilGwonKim on 2019/11/02.
//  Copyright © 2019 Geppetto. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: ViewController<Main> {
    
    private var welcomeLabel = UILabel()
    private var helloButton = UIButton()
    
    override func addSubviews() {
        super.addSubviews()
        view.addSubview(welcomeLabel)
        view.addSubview(helloButton)
    }
    
    override func layout() {
        super.layout()
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        helloButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    override func style() {
        super.style()
        
        navigationItem.title = "GEPPETTO"
        
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .black
        
        helloButton.setTitle("Hello", for: .normal)
        helloButton.setTitleColor(.black, for: .normal)
        helloButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        helloButton.layer.borderColor = UIColor.black.cgColor
        helloButton.layer.borderWidth = 1
        helloButton.layer.cornerRadius = 5
        helloButton.layer.masksToBounds = true
    }
    
    override func behavior() {
        super.behavior()
        
        rx.updated
            .map { $0.welcomeText }
            .bind { [unowned self] welcomeText in
                self.welcomeLabel.text = welcomeText
            }
            .disposed(by: disposeBag)
        
        helloButton.rx.tap
            .mapTo(Message.updateWelcomeText)
            .bind(to: rx.dispatch)
            .disposed(by: disposeBag)
    }
}
