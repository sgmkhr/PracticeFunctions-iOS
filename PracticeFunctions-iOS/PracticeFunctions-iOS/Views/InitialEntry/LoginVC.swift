//
//  LoginVC.swift
//  PracticeFunctions-iOS
//
//  Created by 菅原実希 on 2024/10/12.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let inputUserId = userIdTextField.text ?? ""
        let inputPassword = passwordTextField.text ?? ""
        
        if let correctUser = userList.first(where: { $0 == [inputUserId, inputPassword]}) {
            let storyboard = UIStoryboard(name: "TopVC", bundle: nil)
            let NextVC = storyboard.instantiateViewController(withIdentifier: "TopVC") as! TopVC
            self.navigationController?.pushViewController(NextVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorrect User ID or Password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

#if DEBUG

let userList: [[String]] = [
    ["1", "password1"],
    ["2", "password2"],
    ["3", "password3"]
]

#endif
