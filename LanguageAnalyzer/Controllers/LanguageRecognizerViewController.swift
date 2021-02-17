//
//  LanguageRecognizerViewController.swift
//  LanguageAnalyzer
//
//  Created by Aisha Farooque (admin) on 2/14/21.
//

import UIKit
import MaterialComponents
import NaturalLanguage

class LanguageRecognizerViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: UI Components
    
    let languageRecognizerLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 30)
        textView.text = "Language Recognizer"
        return textView
    }()
    
    let languageRecognizerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(cgColor:#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    let phraseLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
//        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        textView.text = "Enter your phrase below:"
        return textView
    }()
    
    let resultLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
//        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor(cgColor:#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 14)
        return textView
    }()
    
    let messageTextFieldController: MDCTextInputControllerFilled
    
    let messageTextField: MDCTextField = {
        let textField = MDCTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phrase"
        textField.font = UIFont(name: "FranklinGothic-Medium", size: 16)
        return textField
    }()
    
    let goButton: MDCButton = {
        let btn = MDCButton()
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Go", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let backButton: MDCButton = {
        let btn = MDCButton()
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Back", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(cgColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        messageTextField.delegate = self
        messageTextField.returnKeyType = UIReturnKeyType.done
        setupLayout()
    }
    
    // MARK: Lifecycle Functions
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           messageTextFieldController = MDCTextInputControllerFilled(textInput: messageTextField)
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           messageTextFieldController.normalColor = UIColor.lightGray
           messageTextFieldController.activeColor = UIColor.black
           messageTextFieldController.floatingPlaceholderActiveColor = UIColor.black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup Layout
    
    func setupLayout() {
        let guide = self.view.safeAreaLayoutGuide
        
        view.addSubview(languageRecognizerView)
        view.addSubview(languageRecognizerLabel)
        view.addSubview(phraseLabel)
        view.addSubview(messageTextField)
        view.addSubview(goButton)
        view.addSubview(backButton)
        
        languageRecognizerView.topAnchor.constraint(equalTo: languageRecognizerLabel.topAnchor).isActive = true
        languageRecognizerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        languageRecognizerView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        languageRecognizerLabel.centerYAnchor.constraint(equalTo: languageRecognizerView.centerYAnchor, constant: 17).isActive = true
        languageRecognizerLabel.centerXAnchor.constraint(equalTo: languageRecognizerView.centerXAnchor).isActive = true
        
        phraseLabel.centerYAnchor.constraint(equalTo: languageRecognizerLabel.centerYAnchor, constant: 250).isActive = true
        phraseLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10).isActive = true
      
        messageTextField.topAnchor.constraint(equalTo: phraseLabel.bottomAnchor,constant: 20).isActive = true
        messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        goButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 5).isActive = true
        goButton.rightAnchor.constraint(equalTo: messageTextField.rightAnchor, constant: 10).isActive = true
        
        backButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 5).isActive = true
        backButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 5).isActive = true
        
        goButton.addTarget(self, action: #selector(onGoClicked),for: .touchUpInside)
        backButton.addTarget(self, action: #selector(onBackClick),for: .touchUpInside)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewDidLoad()
    }
    
    // MARK: Action Handlers

    @objc func onGoClicked() {
        messageTextField.resignFirstResponder()
        
        let phrase = messageTextField.text!
        if (phrase.count <= 0) {
            printResult(r: "Please enter a phrase.")
        } else {
            let res = result()
            printResult(r: res)
        }
    }
    
    @objc func onBackClick() {
        let welcomPageVC = WelcomePage()
        welcomPageVC.modalPresentationStyle = .fullScreen
        self.present(welcomPageVC, animated: true, completion: nil)
    }


    // MARK: Helper Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messageTextField.resignFirstResponder()
        onGoClicked()
        return true
    }
    
    func result() -> String {
        let phrase = messageTextField.text!
        
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(phrase)
        
        guard let languageCode = recognizer.dominantLanguage?.rawValue else {
            return "The language cannot be identified."
        }
        
        let detectedLanguage = Locale.current.localizedString(forIdentifier: languageCode)!
        return "The language is " + detectedLanguage + "."
    }
    
    func printResult(r: String) {
        let guide = self.view.safeAreaLayoutGuide
        
        view.addSubview(resultLabel)
        resultLabel.text = r
        
        resultLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 50).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 5).isActive = true
    }
}
