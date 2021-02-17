//
//  ViewController.swift
//  LanguageAnalyzer
//
//  Created by Aisha Farooque (admin) on 2/14/21.
//

import UIKit

class WelcomePage: UIViewController {
    
    let languageAnalyzerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(cgColor:#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    let languageAnalyzerLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Language Analyzer"
        return textView
    }()
    
    let languageRecognizerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(cgColor:#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    let languageRecognizerLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Language Recognizer"
        return textView
    }()
    
    
    let partsOfSpeechView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(cgColor:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
        return view
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Parts of Speech"
        return textView
    }()
    
    let copyrightLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Aisha Farooque (c) 2021"
        return textView
    }()
    
    func setupLayout() {
        view.addSubview(languageAnalyzerView)
        view.addSubview(languageAnalyzerLabel)
        view.addSubview(languageRecognizerView)
        view.addSubview(partsOfSpeechView)
        view.addSubview(partsOfSpeechLabel)
        view.addSubview(copyrightLabel)
        
        
        languageRecognizerView.addSubview(languageRecognizerLabel)
        
        let guide = self.view.safeAreaLayoutGuide
        
        languageAnalyzerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        languageAnalyzerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        languageAnalyzerView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        languageAnalyzerLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 3).isActive = true
        languageAnalyzerLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8).isActive = true
        languageAnalyzerLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        languageRecognizerView.topAnchor.constraint(equalTo: languageAnalyzerLabel.bottomAnchor, constant: 275).isActive = true
        languageRecognizerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        languageRecognizerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        languageRecognizerLabel.centerYAnchor.constraint(equalTo: languageRecognizerView.centerYAnchor).isActive = true
        languageRecognizerLabel.centerXAnchor.constraint(equalTo: languageRecognizerView.centerXAnchor).isActive = true
        
        partsOfSpeechView.topAnchor.constraint(equalTo: languageRecognizerView.bottomAnchor).isActive = true
        partsOfSpeechView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        partsOfSpeechView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        partsOfSpeechLabel.centerYAnchor.constraint(equalTo: partsOfSpeechView.centerYAnchor).isActive = true
        partsOfSpeechLabel.centerXAnchor.constraint(equalTo: partsOfSpeechView.centerXAnchor).isActive = true
        
        let languageRecognizerGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onLanguageRecognizer))
        languageRecognizerGesture.numberOfTapsRequired = 1
        languageRecognizerView.addGestureRecognizer(languageRecognizerGesture)
        
        let partsOfSpeechGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPartsOfSpeech))
        partsOfSpeechGesture.numberOfTapsRequired = 1
        partsOfSpeechView.addGestureRecognizer(partsOfSpeechGesture)
        
        copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }

    @objc func onLanguageRecognizer() {
        let languageRecognizerVC = LanguageRecognizerViewController()
        languageRecognizerVC.modalPresentationStyle = .fullScreen
        self.present(languageRecognizerVC, animated: true, completion: nil)
    }
    
    @objc func onPartsOfSpeech() {
        let partsOfSpeechVC = PartsOfSpeechViewController()
        partsOfSpeechVC.modalPresentationStyle = .fullScreen
        self.present(partsOfSpeechVC, animated: true, completion: nil)
    }
}

