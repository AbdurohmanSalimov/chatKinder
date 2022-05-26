//
//  LoginVC.swift
//  Habit
//
//  Created by user1 on 27/04/22.
//

import UIKit
import TransitionButton

class LoginVC: UIViewController {
    @IBOutlet weak var submitBtn: TransitionButton!
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var quastionLbl: UILabel!
    @IBOutlet weak var nameTf: UITextField! {
        didSet {
            nameTf.delegate = self
        }
    }
   
    @IBOutlet weak var passwordTf: UITextField! {
        didSet {
            passwordTf.delegate = self
        }
    }
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var blurV: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

   
    
    @IBAction func submitTapped(_ sender: Any) {
        
        if self.passwordTf.text!.isEmpty || self.nameTf.text!.isEmpty {
            
            if self.nameTf.text!.isEmpty {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                    self.userView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
                    self.userView.backgroundColor = .red
                } completion: { _ in
                    self.userView.backgroundColor = .lightGray
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                        self.userView.transform = .identity
                    }
                }
            }
            if self.passwordTf.text!.isEmpty {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                    self.passwordView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
                    self.passwordView.backgroundColor = .red
                } completion: { _ in
                    self.passwordView.backgroundColor = .lightGray
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                        self.passwordView.transform = .identity
                    }
                }

            }
        } else {
            
            self.submitBtn.startAnimation()
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
                  let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
                  backgroundQueue.async(execute: {
                      sleep(1)
                      DispatchQueue.main.async(execute: { () -> Void in
     
                          if self.nameTf.text!.isEmpty || self.passwordTf.text!.isEmpty {
                              
                              self.submitBtn.stopAnimation(animationStyle: .shake, completion: {
                                  
                              })
                          } else {
                              self.submitBtn.stopAnimation(animationStyle: .expand, completion: { [self] in
                                  
                                  loginUser(name: self.nameTf.text! , password: passwordTf.text!)
                                  
                                  
                                  
                              })
                          }
                      })
                  })
        }
       
    }
    
    
    @IBAction func signupTapped(_ sender: Any) {
        let vc = RegisterVC.init(nibName: "RegisterVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func loginUser(name: String, password: String){
        Network.shared.apollo.perform(mutation: LoginUserMutation(userName: name, password: password)) { result in
            switch result {
            case .success(let graphqlResult):
                if let info = graphqlResult.data?.login {
                    print("🇬🇧🇬🇧🇬🇧🇬🇧🇬🇧🇬🇧🇬🇧🇬🇧🇬🇧correct")
                    Cache.shared.saveUser(id: info.id, name: info.name)
                    let vc = HomeVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
                else {
                    print(graphqlResult.errors)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.userView.backgroundColor = .lightGray
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.userView.backgroundColor = .systemYellow
        return true
    }
    
}
