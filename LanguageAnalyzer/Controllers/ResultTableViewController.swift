//
//  ResultTableViewController.swift
//  LanguageAnalyzer
//
//  Created by Aisha Farooque (admin) on 2/15/21.
//

import UIKit

class ResultTableViewController: UIViewController {
    
    struct PartsOfSpeechClass {
        let part: String
        var word: [String]
    }
    
    // MARK: Variables
    
    let tableView = UITableView()
    
    var partsOfSpeechDictionary = [PartsOfSpeechClass]()
    
     var resultArray: [String] = [] {
        didSet {
            for item in resultArray {
                let p = item.components(separatedBy: ": ")[1]
                let w = item.components(separatedBy: ":")[0]

                partsOfSpeechDictionary.append(PartsOfSpeechClass(part: p, word: [w]))
            }
            
        }
        
        

    }

    // MARK: UI Components
    
    let headerLabel: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.font = UIFont.boldSystemFont(ofSize: 16.0)
        textView.textAlignment = .center
        textView.font = UIFont(name: "FranklinGothic-Medium", size: 30)
        textView.text = "Parts of Speech Result"
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupTableView()
    }
    
    func setupLayout() {
        let guide = self.view.safeAreaLayoutGuide
        
        view.addSubview(headerLabel)

        headerLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 5).isActive = true
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewDidLoad()
    }
}

extension ResultTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        partsOfSpeechDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partsOfSpeechDictionary[section].word.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = partsOfSpeechDictionary[indexPath.section].word[indexPath.row]
        return cell
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return partsOfSpeechDictionary[section].part
    }

}
