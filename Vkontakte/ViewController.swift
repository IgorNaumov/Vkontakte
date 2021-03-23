//
//  ViewController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logotype: LogotypeView!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func loginButton(_ sender: Any) {
        check()
    }
    func check() {
        let login = userName.text!
        let password = userPassword.text!
        
        if login == "a" && password == "1" {
            print("Добро пожаловать в PLAT")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
            vc.modalPresentationStyle = .fullScreen
            
            present(vc, animated: true, completion: nil)
            
        }else{
            print("Неверный логин или пароль")
            
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    @objc func keyboardWasShown(notification: Notification){
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey:UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) .cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left:0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    @objc func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
        override func viewWillAppear(_ animated: Bool){
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func hideKeyboard(){
        self.scrollView?.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        // Do any additional setup after loading the view.
    }
    }
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            userPassword.becomeFirstResponder()
        }else {
           check()
        }
        return true
    }
}

final class LogotypeView: UIImageView {
    override func layoutSubviews () {
        super.layoutSubviews()
        // shadow donwload
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius  = 20
        layer.shadowOffset = .zero
        
        //radius image
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
       
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
        
    }

}
    



