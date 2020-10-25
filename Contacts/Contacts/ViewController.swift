//
//  ViewController.swift
//  Contacts
//
//  Created by Albert Ahmadiev on 20.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var sectionsData: [SectionData]?
    
    var contacts: [Contact] = []
    
    private struct SectionData {
        let sectionTitle: String
        let cells: [Cell]
    }
    
    private enum Section: String {
        case A
        case E
        case M
        case N
        case R
    }
    
    private struct Cell {
        let contact: Contact
    }
    
    private func loadData() {
        sectionsData = [
            SectionData(sectionTitle: Section.A.rawValue, cells:[
                .init(contact: contacts[0])
            ]),
            SectionData(sectionTitle: Section.E.rawValue, cells: [
                .init(contact: contacts[1])
            ]),
            SectionData(sectionTitle: Section.M.rawValue, cells: [
                .init(contact: contacts[2])
            ]),
            SectionData(sectionTitle: Section.N.rawValue, cells: [
                .init(contact: contacts[3]),
                .init(contact: contacts[4]),
                .init(contact: contacts[5])
            ]),
            SectionData(sectionTitle: Section.R.rawValue, cells: [
                .init(contact: contacts[6])
            ])
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
        self.tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        createContacts()
        loadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellsData = sectionsData?[section] else { return 0 }
        return cellsData.cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsData?[section].sectionTitle ?? nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellsData = sectionsData?[indexPath.section]
        else { fatalError("Attempt to get data while it is not loaded") }
        
        return fillBasicCell(for: indexPath, from: tableView, name: cellsData.cells[indexPath.row].contact.name, surname: cellsData.cells[indexPath.row].contact.surname)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactViewController: ContactViewController
                = storyboard?.instantiateViewController(identifier: "ContactViewController")
        else { return }
        
        guard let contact = sectionsData?[indexPath.section].cells[indexPath.row].contact else {return}
        
        contactViewController.loadViewIfNeeded()
        contactViewController.setContact(contact: contact)
        show(contactViewController, sender: nil)
    }
    
    private func createContacts(){
        let contact1 = Contact(name: "Albert⚽️",surname: "Akhmadiev", number: "+7 (987) 180-26-56", image: #imageLiteral(resourceName: "6"))
        let contact2 = Contact(name: "Evelina💃",surname: "`JKSDNS`", number: "+7 (999) 999-99-99", image: #imageLiteral(resourceName: "4"))
        let contact3 = Contact(name: "Misha🔞",surname: "Khovaev", number: "+7 (917) 880-88-88", image: #imageLiteral(resourceName: "7"))
        let contact4 = Contact(name: "Nikita1🛠",surname: "Lyapa", number: "+7 (907) 770-76-77", image: #imageLiteral(resourceName: "2"))
        let contact5 = Contact(name: "Nikita2👨🏻‍🦰",surname: "Sos", number: "+7 (555) 555-55-55", image: #imageLiteral(resourceName: "5"))
        let contact6 = Contact(name: "Nikita3👨🏻‍💻",surname: "Zarip", number: "+7 (444) 444-44-44", image: #imageLiteral(resourceName: "3"))
        let contact7 = Contact(name: "Rishat💇🏾‍♂️",surname: "Latypov", number: "+7 (333) 333-33-33", image: #imageLiteral(resourceName: "1"))
        
        contacts.append(contact1)
        contacts.append(contact2)
        contacts.append(contact3)
        contacts.append(contact4)
        contacts.append(contact5)
        contacts.append(contact6)
        contacts.append(contact7)
    }
    
    private func fillBasicCell(for indexPath: IndexPath, from tableView: UITableView, name: String, surname: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contact",
            for: indexPath
        )
        cell.textLabel?.text = "\(name) \(surname)"
        return cell
    }
}

struct Contact {
    let name: String
    let surname: String
    let number: String
    let image: UIImage
}
