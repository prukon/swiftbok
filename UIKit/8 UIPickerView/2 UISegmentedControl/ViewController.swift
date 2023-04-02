//
//  ViewController.swift
//  2 UISegmentedControl
//
//  Created by Evgeniy Ustyan on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UIButton",
                      "UITextField",
                      "UIDatePicker"]
    
    var selectedElement: String?
    
    @IBOutlet weak var segmentConrol: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        label.isHidden = true
        slider.value = 1
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2  //кол-во строк в label
        
        segmentConrol.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .blue
        
        datePicker.locale = Locale.init(identifier: "ru_RU")
        choiceUiElements()
        createToolBar()
    }
    
    func hideAllElements () {
        segmentConrol.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
        switchLabel.isHidden = true
        
    }
    
    func choiceUiElements() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        //costomize
        elementPicker.backgroundColor = .brown
    }
    
    func createToolBar () {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
        
        //costomize
        toolBar.tintColor = .white
        toolBar.barTintColor = .brown
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segmentConrol.selectedSegmentIndex {
        case 0:
            label.text = "First segment selected"
            label.textColor = .red
        case 1:
            label.text = "Second segment selected"
            label.textColor = .blue
        case 2:
            label.text = "Third segment selected"
            label.textColor = .yellow
        default:
            print("Somthing wrong")
        }
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        //изменение прозрачности вью
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            //создание алерта
            let alert = UIAlertController(title: "Wrong format", message: "Please Enter your name", preferredStyle: .alert)
            let okActon = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okActon)
            present(alert, animated: true)
            
            print("Format is wrong!")
        } else {
            label.text = textField.text
            textField.text = nil
        }
        
        
    }
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_RU")
        let dateValue = dateFormater.string(from: sender.date)
        label.text = dateValue
        
    }
    @IBAction func switchActon(_ sender: UISwitch) {
        segmentConrol.isHidden = !segmentConrol.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        doneButton.isHidden = !doneButton.isHidden
        
        if sender.isOn {
            switchLabel.text = "Отобразить все элементы"
        } else {
            switchLabel.text = "Скрыть все элементы"
        }
    }
}

extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  uiElements.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    func  pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            segmentConrol.isHidden = false
        case 1:
            hideAllElements()
            label.isHidden = false
            
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
            doneButton .isHidden = false
        case 2:
            hideAllElements()
        case 4:
            hideAllElements()
            datePicker.isHidden = false
        default:  hideAllElements()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel =  view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
}
