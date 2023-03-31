//
//  ViewController.swift
//  NamesApp Interface
//
//  Created by Evgeniy Ustyan on 15.03.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var yourameTF: UITextField!
    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var returnScore: UILabel!
   
     override func viewDidLoad() {
        super.viewDidLoad()
    }

    //метод для передачи данных с одного экрана на другой
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinatonVC = segue.destination as? ResultViewController else { return }
        destinatonVC.firstName = yourameTF.text
        destinatonVC.secondName = partnerNameTF.text
    }
    
    
    @IBAction func resultButtonTapped() {
        
//        Проверка на пустые поля и с выводом алерта
        guard let firstName = yourameTF.text, let secondName = partnerNameTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
         showAlert(
            title: "Names are missing",
            message: "Please enter both names"
         )
        return
        }
        
        //переход ко второму экрану по идентификатору сигвея
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        yourameTF.text = ""
        partnerNameTF.text = ""

        guard let sourceVC = segue.source as? ResultViewController else { return }
        returnScore.text = sourceVC.resultLabel.text
    }

    
    
    
}

extension FirstViewController: UITextViewDelegate {
    
    //скрытие клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //метод перехода между полями с помощью экранной клавиатуры.  При нажатии на done - вызов второго экрана (не работает)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
    return true
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)       //добавляем кнопку в алерт
        present(alert, animated: true)  // вывод алерта
      
    }
}
