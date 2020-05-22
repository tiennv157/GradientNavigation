//
//  ViewController.swift
//  GradientNavigation
//
//  Created by TienNVan on 5/22/20.
//  Copyright © 2020 TienNVan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: true)
    }
}

class BaseViewController: UIViewController {
    
    var baseNavigationController: BaseNavigationController? {
        return navigationController as? BaseNavigationController
    }
    
    var backButton: UIButton?
    var titleLabel: UILabel?
    
    override func loadView() {
        view = _BackgroundView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    func addBackButton() {
        guard titleLabel == nil else {
            fatalError("you must add back button first")
        }
        #warning("modify button name")
        let image = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .white
//        button.addTarget(self, action: #selector(goback), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.backButton = button
    }
    
    func addTitleLabel(_ title: String) {
        
        let label = UILabel()//UILabel(text: title, font: .systemFont(ofSize: 17, weight: .semibold), textColor: .white, textAlignment: .left, numberOfLines: 1)
        view.addSubview(label)
        #warning("layout title label")
        if #available(iOS 11.0, *) {
            if backButton != nil {
//                label.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: backButton?.trailingAnchor, bottom: nil, trailing: nil, padding: .zero, size: .init(h: 44))
            } else {
//                label.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(l: 16), size: .init(h: 44))
            }
        } else {
            if backButton != nil {
//                label.anchor(top: view.topAnchor, leading: backButton?.trailingAnchor, bottom: nil, trailing: nil, padding: .init(t: UIApplication.shared.statusBarFrame.height), size: .init(h: 44))
            } else {
//                label.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(t: UIApplication.shared.statusBarFrame.height, l: 16), size: .init(h: 44))
            }
        }
        self.titleLabel = label
    }
}

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addBackButton()
        addTitleLabel("Your title")
    }
    
    override func setupUI() {
        
    }

}

