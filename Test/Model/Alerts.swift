//
//  Alerts.swift
//  Test
//
//  Created by Игорь Ущин on 01.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertAccept(title: String, message: String, prefferedSyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default)
            alert.addAction(action)
            
            self.present(alert, animated: true)
            
        
    }
}
