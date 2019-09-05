//
//  CreateEventViewController.swift
//  EventMaker
//
//  Created by Anderson Lentz on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var localAdressTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var creatorsNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var hourTextField: UITextField!
    @IBAction func choosePhoto(_ sender: UIButton) {
    }
    
    @IBAction func createEventButton(_ sender: UIButton) {
        
        saveEvent()
        
        
    }
    @IBOutlet weak var dataTextField: UITextField!
    
    
    @IBAction func date(_ sender: UITextField) {
 
    }
    
    fileprivate let pickerView = ToolbarPickerView()
    private var firebase: EventDatabase?
    var currentTappedTextField : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        localAdressTextField.delegate = self
        priceTextField.delegate = self
        creatorsNameTextField.delegate = self
        hourTextField.delegate = self
       
        
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.locale = Locale(identifier: "pt_BR")
        datePickerView.addTarget(self, action: #selector(CreateEventViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        //dataTextField.inputView = datePickerView
        dataTextField.inputView = datePickerView
        dataTextField.inputAccessoryView = self.pickerView.toolbar
        
        let hourPicker:UIDatePicker = UIDatePicker()
        hourPicker.locale = Locale(identifier: "pt_BR")
        hourPicker.datePickerMode = .time
        hourPicker.addTarget(self, action: #selector(CreateEventViewController.hourPickerValueChanged), for: UIControl.Event.valueChanged)
        hourTextField.inputView = hourPicker
        hourTextField.inputAccessoryView = self.pickerView.toolbar
        
        self.pickerView.toolbarDelegate = self
        
      
        firebase = EventDatabase(database: EventServiceFirebase.shared)
        
        
        tabBarController?.tabBar.items?.last?.image = #imageLiteral(resourceName: "ic_criar_evento")
       

       

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextView = segue.destination as? PostEventCreationViewController,
            let eventID = sender as? String{
            
            nextView.eventID = eventID
        }
    }
    
    
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//
//        if(currentTappedTextField == descriptionTextField){
//            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//                if self.view.frame.origin.y == 0 {
//                    self.view.frame.origin.y -= keyboardSize.height
//                }
//            }
//        }
//
//
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        
        dataTextField.text = dateFormatter.string(from: sender.date)
        
    }

    @objc func hourPickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: sender.date)
        
        guard let hour = comp.hour,
            let minute = comp.minute else {return}
      
        hourTextField.text = "\(hour):\(minute)"
        
    }
    
    func saveEvent(){
        
        let adress = localAdressTextField.text ?? "N/I"
        let creator = creatorsNameTextField.text ?? "N/I"
        let name = nameTextField.text ?? "N/I"
        let date = dataTextField.text ?? "N/I"
        let hour = hourTextField.text ?? "N/I"
        let description = descriptionTextField.text ?? "N/I"
        let price = priceTextField.text ?? "0.0"
        
    
        let event = Event(address: adress,
                          creator: creator,
                          date: date,
                          hour: hour,
                          description: description,
                          isSharedPrice: true,
                          name: name,
                          participants:[],
                          price: Double(price))
        
        
        firebase?.database.addEvent(event: event, completion: { [weak self] eventID in
            
            self?.performSegue(withIdentifier: "presentPostEventSegue", sender: eventID)

        })
        
    }

}

extension CreateEventViewController: ToolbarPickerViewDelegate{
    func didTapDone() {
        self.view.endEditing(true)
    }
    
    func didTapCancel() {
        
    }
    
    
}

extension CreateEventViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

