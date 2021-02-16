//
//  ViewController.swift
//  LanguageAnalyzer
//
//  Created by Aisha Farooque (admin) on 2/14/21.
//

import UIKit

class WelcomePage: UIViewController {
    
    let welcomePageTitle: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Language Analyzer"
        return textView
    }()
    
    func setupLayout() {
        view.addSubview(welcomePageTitle)
        
        let guide = self.view.safeAreaLayoutGuide
        
        welcomePageTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 3).isActive = true
        welcomePageTitle.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        welcomePageTitle.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    
}

