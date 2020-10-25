//
//  ContactViewController.swift
//  Contacts
//
//  Created by Albert Ahmadiev on 22.10.2020.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        self.view.backgroundColor = .systemGray5
        number.backgroundColor = .white
        number.textColor = .systemBlue
        number.layer.masksToBounds = true
        number.layer.cornerRadius = 5
    }
    
    func setContact(contact: Contact) {
        imageView.image = contact.image
        name.text = contact.name
        surname.text = contact.surname
        number.text = contact.number
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
