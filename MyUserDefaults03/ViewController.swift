//
//  ViewController.swift
//  MyUserDefaults
//
//  Created by Luc Derosne on 29/09/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id_ui: UITextField!
    @IBOutlet weak var pseudo_ui: UITextField!
    @IBOutlet weak var vip_ui: UISwitch!
    @IBOutlet var uiView: UIView!
    
    private var myID: String = ""
    private var myPseudo: String = ""
    private var myColor: String = ""
    private var myVip: Bool = false
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserdefaults()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        UserSettings.id = id_ui.text!
        UserSettings.pseudo = pseudo_ui.text!
    }
    
    private func loadUserdefaults() {
        let myID = UserSettings.id
        id_ui.text = myID
        let myPseudo = UserSettings.pseudo
        pseudo_ui.text = myPseudo
        let myVip = UserSettings.vip
        vip_ui.isOn = myVip
        let myColor = UserSettings.backColor
        uiView.backgroundColor = myColor
    }
    
    @IBAction func vipSwitchButtonTapped(_ sender: Any) {
        UserSettings.vip = vip_ui.isOn
    }
    
    @IBAction func changeBackGrounColor(_ sender: UIButton) {
        uiView.backgroundColor = sender.backgroundColor
        let uicolorBack = uiView.backgroundColor
        UserSettings.backColor =  uicolorBack ?? .blue
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        id_ui.text = ""
        pseudo_ui.text = ""
        myVip = false
        uiView.backgroundColor = .blue
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        defaults.synchronize()

    }
}


