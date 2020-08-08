//
//  ViewController.swift
//  EllcoTest
//
//  Created by Мурад on 05.08.2020.
//  Copyright © 2020 Murad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureStartButton()
        configureLayout()
    }
    
    func configureStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = .blue
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(pushSecondViewController), for: .touchUpInside)
        
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitle("Start", for: .normal)
        self.view.addSubview(startButton)
    }
    
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        startButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func pushSecondViewController() {
        let layout = UICollectionViewFlowLayout()
        let secVc = SecondViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(secVc, animated: true)
    }
    
}

