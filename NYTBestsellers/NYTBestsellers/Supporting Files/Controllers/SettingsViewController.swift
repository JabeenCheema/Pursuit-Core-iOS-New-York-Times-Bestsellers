//
//  SettingsViewController.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let settingsview = SettingsView()
    
    private var settingspicker = [BestsellerGenre]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsview.settingspicker.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.7283005012, blue: 0.7542496862, alpha: 1)
        self.view.addSubview(settingsview)
        settingsview.settingspicker.delegate = self
        settingsview.settingspicker.dataSource = self 
        loadGenres()
        
        
    }
    
    func loadGenres() {
        APIClient.getGenres { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                self.settingspicker = data
            }
        }
    }
}


extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingspicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingspicker[row].listName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let category = settingspicker[row]
        UserDefaults.standard.set(category.listName,forKey: "genre")
    }
    
    
}
