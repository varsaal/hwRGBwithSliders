//
//  ViewController.swift
//  hwRGBwithSliders
//
//  Created by 1234 on 08.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var redTextfild: UITextField!
    @IBOutlet weak var greenTextfild: UITextField!
    @IBOutlet weak var blueTextfild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup sliders
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        //blueSlider.minimumTrackTintColor = .blue
        redSlider.maximumTrackTintColor = .gray
        greenSlider.maximumTrackTintColor = .gray
        blueSlider.maximumTrackTintColor = .gray
        redSlider.minimumValue = 0
        greenSlider.minimumValue = 0
        blueSlider.minimumValue = 0
        redSlider.maximumValue = 1
        greenSlider.maximumValue = 1
        blueSlider.maximumValue = 1
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        // Setup labels
        
        setValueForLabel()
        
        // Setup textfild
        
        redTextfild.text = String(redSlider.value)
        greenTextfild.text = String(greenSlider.value)
        blueTextfild.text = String(blueSlider.value)
        
        // Setup view
        
        colorView.layer.cornerRadius = 15
        
        setColor()
        addDoneButtonTo(redTextfild)
        addDoneButtonTo(greenTextfild)
        addDoneButtonTo(blueTextfild)
        
        //addDoneButtonTo(redTextfild)
        //addDoneButtonTo(greenTextfild)
        //addDoneButtonTo(blueTextfild)
        
        
        
    }
    
    func setValueForLabel () {
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
    }
    
    @IBAction func rgbSliders(_ sender: UISlider) {
        print(#function)
        switch sender.tag {
        case 0:
            redLabel.text = string(from: sender)
            redTextfild.text = string(from: sender)
        case 1:
            greenLabel.text = string(from: sender)
            greenTextfild.text = string(from: sender)
        case 2:
            blueLabel.text = string(from: sender)
            blueTextfild.text = string(from: sender)
        default: break
        }
        
        setColor()
    }
    
    private func string(from value: UISlider) -> String{
        print(#function)
        return String(format: "%.2f", value.value)
        
    }
    
    private func setColor() {
        print(#function)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }

}

// MARK: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {

    // Скрытие клавиатуры по нажатию на кнопку Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        // resignFirstResponder скрывает клавиатуру для текстового поля
        
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по нажатию на view
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            
            setColor()
            setValueForLabel()
            
        } else {
            showAlert(title: "Wrong formate!", message: "Please enter corrent value")
        }
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String){
        print(#function)
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay",
                                       style: .default)
        alert.addAction(okayAction)
        present(alert, animated: true)
    }
    
    private func addDoneButtonTo(_ textField: UITextField) {
        print(#function)
        let keyboardToolbar = UIToolbar()
        // Применили для текстового поля
        textField.inputAccessoryView = keyboardToolbar
        // Расширили тулбар по размеру клавиатуры
        keyboardToolbar.sizeToFit()
        // action - какой метод должен вызывать по нажатию на "Готово"
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(dadTapDone))
        // flexBarButton - нужно? чтобы подвинуть кнопку в правую часть клавиатуры
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
        
    }
    
    @objc private func dadTapDone() {
        print(#function)
        view.endEditing(true)
    }
}
