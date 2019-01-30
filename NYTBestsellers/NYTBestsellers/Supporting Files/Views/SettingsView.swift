//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    lazy var settingspicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds) // override the super view which is the view of the viewcontroller
        settingsViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsViewConstraints() {
        self.addSubview(settingspicker)
        settingspicker.translatesAutoresizingMaskIntoConstraints = false
        settingspicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        settingspicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        settingspicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        settingspicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    
    
    
    
    
}
