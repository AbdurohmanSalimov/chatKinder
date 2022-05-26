//
//  HomeVC.swift
//  chatKinder
//
//  Created by Azizbek Salimov on 25.05.2022.
//

import UIKit
import Apollo

class HomeVC: UIViewController {
    
    @IBOutlet weak var textFieldM: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var cancelLbl: Cancellable?
    
    var messagesArray: [GetMessagesQuery.Data.Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldM.becomeFirstResponder()
        delegateTableView()
        fetchMessages()
        subscription()
        
    }
    
    @IBAction func textFieldActing(_ sender: Any) {
    }
    func fetchMessages(){
        Network.shared.apollo.fetch(query: GetMessagesQuery()) { result in
            
            switch result {
            case .success(let graphqlResult) :
                if let messages = graphqlResult.data?.messages {
                    self.messagesArray = messages.compactMap{$0}
                    print(self.messagesArray)
                    self.tableView.reloadData()
                }
                else if let error = graphqlResult.errors {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func writeMessage(message: String ) {
        Network.shared.apollo.perform(mutation: WriteMessageMutation.init(message: message, userID: Cache.shared.getUserId())) {  result in
            switch result {
            case .success(_):
                print("sms ketdi")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func subscription(){
        cancelLbl = Network.shared.apollo.subscribe(subscription: SubscriptionSubscription(), resultHandler: { [self] res in
            switch res {
                
            case .success(let graphResult):
                if let info = graphResult.data?.newMessage {
                    self.messagesArray.append(GetMessagesQuery.Data.Message.init(userId: info.userId, messageId: info.messageId, message: info.message, name: info.name))
                    tableView.reloadData()
               
                }
            case .failure(_):
                print("error")
            }
        })
       
    }
    
    
    
    
}




extension HomeVC: UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    func delegateTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TVC", bundle: nil), forCellReuseIdentifier: "TVC")
        textFieldM.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as? TVC else { return UITableViewCell() }
        cell.massageLbl.text = messagesArray[indexPath.row].message
        cell.lblFrom.text = messagesArray[indexPath.row].name
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [tableView] in
                        if self.messagesArray.count > 0 {
                            self.tableView.scrollToRow(at: IndexPath(item: self.messagesArray.count - 1 , section: 0), at: .bottom, animated: false)
                            }
                        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        writeMessage(message: textFieldM.text!)
        return true
    }
}
