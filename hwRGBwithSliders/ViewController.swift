//
//  ViewController.swift
//  hwRGBwithSliders
//
//  Created by 1234 on 08.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redTextfild: UITextField!
    @IBOutlet var greenTextfild: UITextField!
    @IBOutlet var blueTextfild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup sliders
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        redSlider.maximumTrackTintColor = .gray
        greenSlider.maximumTrackTintColor = .gray
        blueSlider.maximumTrackTintColor = .gray
        redSlider.minimumValue = 0
        greenSlider.minimumValue = 0
        blueSlider.minimumValue = 0
        
        
    }


}

