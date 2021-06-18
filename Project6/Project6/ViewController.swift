//
//  ViewController.swift
//  Project6
//
//  Created by Matvey Garbuzov on 15.06.2021.
//

import UIKit

class ViewController: UITableViewController {
    var allWords  = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        startGame()
    }
    
    func setupButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemYellow
        navigationItem.leftBarButtonItem?.tintColor  = UIColor.systemYellow
    }
    
    @objc func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        cell.backgroundColor = UIColor.systemGray6
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    if isOneLetter(word: lowerAnswer) {
                        if isEqualToOriginal(word: lowerAnswer) {
                            if isEmpty(word: lowerAnswer) {
                                usedWords.insert(answer.lowercased(), at: 0)
                                
                                let indexPath = IndexPath(row: 0, section: 0)
                                tableView.insertRows(at: [indexPath], with: .automatic)
                                
                                return
                            } else {
                                showErrorMessage(title: "It's an empty string", message: "You can't enter empty string")
                            }
                        } else {
                            showErrorMessage(title: "It's initial word", message: "You can't enter the initial word")
                        }
                    } else {
                        showErrorMessage(title: "It's not a word", message: "You can't make words out of 1 letter")
                    }
                } else {
                    showErrorMessage(title: "Word not recognized", message: "You can't make words")
                }
            } else {
                showErrorMessage(title: "Word already used", message: "Be more original")
            }
        } else {
            showErrorMessage(title: "Word not possible", message: "You can't spell that word from \(title!.lowercased()).")
        }
        
    }
    
    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }

        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func isOneLetter(word: String) -> Bool {
        if (word.count == 1) {
            return false
        }
        return true
    }
    
    func isEqualToOriginal(word: String) -> Bool {
        return !(title == word)
    }
    
    func isEmpty(word: String) -> Bool {
        return !word.isEmpty
    }
}

