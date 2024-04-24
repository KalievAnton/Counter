//
//  ViewController.swift
//  Counter
//
//  Created by Тони on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var titleButton: UIButton!
    
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelText.text = "0"
        
        titleButton.setTitle("Счетчик", for: .normal)
        titleButton.backgroundColor = .lightGray
        titleButton.tintColor = .black
        titleButton.layer.cornerRadius = 10
    }
    
    private func configureAppearance() {
        titleButton.addTarget(self, action: #selector (titleButtonAction), for: .touchUpInside)
    }
    
    @objc func titleButtonAction() {
        counter += 1
        labelText.text = "Значение счётчика: \(counter)"
    }
}

