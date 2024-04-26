//
//  ViewController.swift
//  Counter
//
//  Created by Тони on 24.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak private var counterValueLabel: UILabel!
    @IBOutlet weak private var counterTextView: UITextView!
    @IBOutlet weak private var increaseCounterButton: UIButton!
    @IBOutlet weak private var decreaseCounterButton: UIButton!
    @IBOutlet weak private var resetCounterButton: UIButton!
    
    private var counter = 0
    
    private let dateFormatter: DateFormatter = {
        let data = DateFormatter()
        data.dateFormat = "dd.MM.yyyy-hh:mm:ss"
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        counterValueLabel.text = "0"
        counterTextView.text = "История изменений:\n"
        counterTextView.isScrollEnabled = true
        counterTextView.isEditable = false
    }
    
    private func configureAppearance() {
        increaseCounterButton.addTarget(self, action: #selector (increaseCounterButtonAction), for: .touchUpInside)
        decreaseCounterButton.addTarget(self, action: #selector (decreaseCounterButtonAction), for: .touchUpInside)
        resetCounterButton.addTarget(self, action: #selector (resetCounterButtonAction), for: .touchUpInside)
    }
    
    @objc private func increaseCounterButtonAction() {
        counter += 1
        counterValueLabel.text = "\(counter)"
        counterTextView.text.append("\(dateFormatter.string(from: Date())): Значение изменено на +1\n")
    }
    
    @objc private func decreaseCounterButtonAction() {
        if counter > 0 {
            counter -= 1
            counterTextView.text.append("\(dateFormatter.string(from: Date())): Значение изменено на -1\n")
            counterValueLabel.text = "\(counter)"
        } else if counter == 0 {
            counterTextView.text.append(
                "\(dateFormatter.string(from: Date())): Попытка уменьшить значение счётчика ниже 0\n"
            )
        }
    }
    
    @objc private func resetCounterButtonAction() {
        counter = 0
        counterValueLabel.text = "0"
        counterTextView.text.append("\(dateFormatter.string(from: Date())): Значение сброшено\n")
    }
}
