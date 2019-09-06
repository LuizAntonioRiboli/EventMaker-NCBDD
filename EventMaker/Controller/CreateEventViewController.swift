//
//  CreateEventViewController.swift
//  EventMaker
//
//  Created by Anderson Lentz on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    @IBOutlet weak var createEvent: UIButton!
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var localAdressTextField: UITextField!
    
    @IBOutlet weak var priceDistributionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var creatorsNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    @IBOutlet weak var hourTextField: UITextField!
    
    @IBAction func choosePhoto(_ sender: UIButton) {
    }
    
    @IBAction func createEventButton(_ sender: UIButton) {
        
        saveEvent(completion: { event in
            
        })
    }
    @IBOutlet weak var dataTextField: UITextField!
    
    
    @IBAction func date(_ sender: UITextField) {
 
    }
    
    fileprivate let pickerView = ToolbarPickerView()
    public var firebase: EventDatabase?
    var currentTappedTextField : UITextField?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        localAdressTextField.delegate = self
        priceTextField.delegate = self
        creatorsNameTextField.delegate = self
        hourTextField.delegate = self
        priceDistributionTextField.delegate = self
        
        descriptionTextView.delegate = self
        
        
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
        
        
        descriptionTextView.layer.borderWidth = 0.1
        descriptionTextView.layer.cornerRadius = 8

        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
      
        firebase = EventDatabase(database: EventServiceFirebase.shared)
        
        
//        tabBarController?.tabBar.items?.last?.image = #imageLiteral(resourceName: "ic_criar_evento-1")
       

       

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard () {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextView = segue.destination as? PostEventCreationViewController,
            let eventMain = sender as? SenderStructure {
            
            nextView.eventID = eventMain.eventID
            nextView.event = eventMain.event
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
    
    func saveEvent(completion: @escaping (Event) -> Void) {
        
        let adress = localAdressTextField.text ?? "N/I"
        let creator = creatorsNameTextField.text ?? "N/I"
        let name = nameTextField.text ?? "N/I"
        let date = dataTextField.text ?? "N/I"
        let hour = hourTextField.text ?? "N/I"
        let description = descriptionTextView.text ?? "N/I"
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
            
            let senderStructure = SenderStructure(eventID: eventID, event: event)
            self?.performSegue(withIdentifier: "presentPostEventSegue", sender: senderStructure )

            completion(event)
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


extension CreateEventViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionTextView.text = ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text == "" {
            descriptionTextView.text = "Descreva seu evento aqui :)"
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
