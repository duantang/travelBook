//
//  placeViewController.swift
//  travelBook
//
//  Created by Kevin Schwarz on 29.03.18.
//  Copyright © 2018 KSARC. All rights reserved.
//
//
// ViewController zur Steuerung des Reise-Erstellungsviews.
// View Controller Code für das hinzufügen einer Reise mit optionalem Bild und Datum.


import UIKit

class placeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //ImagePicker
    var imagePicker = UIImagePickerController()
    // Reisestart Textfeld in Arbeit
    @IBOutlet weak var dateEndTextField: UITextField!
    // Reiseende Textfeld in Arbeit
    @IBOutlet weak var dateBeginTextField: UITextField!
    // Reiseziel Textfeld ohne Funktion
    @IBOutlet weak var titleTextField: UITextField!
    //Foto aus Album Button in Arbeit, siehe unten.
    @IBAction func photoTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    // Hier geht es weiter !!!! **** !!!! **** !!!!
    // BADABINGBADABOOM!!
    // uncomment| func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //   <#code#>
    // }
    // BADABINGBADABOOM!!
    // Hier geht es weiter !!!! **** !!!! **** !!!!

    
    
    //Foto von Kamera Button ohne Funktion
    @IBAction func cameraTapped(_ sender: Any) {
    }
    //Hinzufügen und speichern ohne Funktion
    @IBAction func addTapped(_ sender: Any) {
    }
    //Bild des Reiseziels ohne Funktion
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        imagePicker.delegate = self
        
    }
    
    // Start Datepicker Code
    // schlechte aber funktionierende Version
let datePicker = UIDatePicker()
let dateEndPicker = UIDatePicker()
    
    func createDatePicker() {
        
        datePicker.datePickerMode = .date
        dateEndPicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: true)
        
        dateBeginTextField.inputAccessoryView = toolbar
        dateEndTextField.inputAccessoryView = toolbar
        dateBeginTextField.inputView = datePicker
        dateEndTextField.inputView = dateEndPicker
    }
    
    @objc func doneTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        dateBeginTextField.text = dateFormatter.string(from: datePicker.date)
        dateEndTextField.text = dateFormatter.string(from: dateEndPicker.date)
        self.view.endEditing(true)
    }
    //Ende Datepicker Code
}
