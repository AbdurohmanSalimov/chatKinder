//
//  RegisterVC.swift
//  Habit
//
//  Created by user1 on 29/04/22.
//

import UIKit
import TransitionButton

class RegisterVC: UIViewController {

    @IBOutlet weak var authorization: UILabel!
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var langBtn: UIButton!
    override func viewDidLoad() {
            super.viewDidLoad()


            }


    @IBAction func registrTapped(_ sender: Any) {
        registerUsername(name: usernameTf.text!, password: passwordTf.text!)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func langTapped(_ sender: Any) {
    }
    @IBAction func skipTapped(_ sender: Any) {
       
    }
    
    func registerUsername(name: String , password: String) {
        Network.shared.apollo.perform(mutation: SignUpMutation.init(userName: name, password: password)) { result in
            switch result {
            case .success(let graphqlResult):
                if let register = graphqlResult.data?.signUp {
                    Cache.shared.saveUser(id: register.id, name: register.name)
                    let vc = HomeVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                                    }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
