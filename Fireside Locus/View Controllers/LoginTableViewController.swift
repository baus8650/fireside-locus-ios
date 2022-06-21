//
//  LoginTableViewController.swift
//  Fireside Locus
//
//  Created by Tim Bausch on 4/13/22.
//

import UIKit

class LoginTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.isHidden = true
        }
    }
    @IBOutlet var emailField: UITextField! {
        didSet {
            emailField.keyboardType = .emailAddress
            emailField.autocorrectionType = .no
        }
    }
    @IBOutlet var passwordField: UITextField! {
        didSet {
            passwordField.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor(named: "luzerneColor")
        header.textLabel?.text = header.textLabel?.text?.capitalized
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func login() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let email = emailField.text,
              !email.isEmpty
        else {
            ErrorPresenter.showError(message: "Please enter your email", on: self)
            return
        }
        
        guard let password = passwordField.text,
              !password.isEmpty
        else {
            ErrorPresenter.showError(message: "Please enter your password", on: self)
            return
        }
        
        Auth().login(username: email, password: password) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    
                    Auth().setUpCoreData()
                    Auth().fetchCampers()
                    Auth().fetchEvents()
                    let scene = UIApplication.shared.connectedScenes.first
                    if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                        let rootController =
                        UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainVC")
                        sceneDelegate.window?.rootViewController = rootController
                    }
                }
            case .failure:
                let message = "Could not login. Check your credentials and try again"
                ErrorPresenter.showError(message: message, on: self)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        login()
        return true
    }
    
}
