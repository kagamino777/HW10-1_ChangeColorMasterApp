//
//  ViewController.swift
//  0818_ChangeColor
//
//  Created by JaBa CHIA on 2020/8/18.
//

import UIKit

class ViewController: UIViewController {
    // 圖片：背景、帽子純色（mask前）
    @IBOutlet weak var dinoBackgroundImageView: UIImageView!
    @IBOutlet weak var dinoHatView: UIView!
    // 圖片：花紋圖片
    @IBOutlet weak var lepordPatternImageView: UIImageView!
    @IBOutlet weak var giraffePatternImageView: UIImageView!
    
    // 局部調整 選擇變色物件的SegmentedControl
    @IBOutlet weak var changeElementSegmentedControl: UISegmentedControl!
    
    // 局部調整 顏色Slider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    // 局部調整 顯示顏色對應數值的Label
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    // 局部調整 花色
    @IBOutlet weak var patternSwitch: UISwitch!
    @IBOutlet weak var lepardPatternButton: UIButton!
    @IBOutlet weak var giraffePatternButton: UIButton!
    
    // 圖片調整 三個Slider＆陰影view
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var shadowView: UIView!
    
    // 用變數來儲存 帽子、背景、邊框三種物件的各項調整值（此為初始值，使用者調整過Slider後則會存入新的值）
    var hatRedValue: Float = 47/255
    var hatGreenValue: Float = 44/255
    var hatBlueValue:Float = 63/255
    var hatAlphaValue: Float = 1
    var bgRedValue: Float = 247/255
    var bgGreenValue: Float = 253/255
    var bgBlueValue: Float = 119/255
    var bgAlphaValue: Float = 1
    var borderRedValue: Float = 0
    var borderGreenValue: Float = 0
    var borderBlueValue: Float = 0
    var borderAlphaValue: Float = 1
    
    // 花色狀態儲存（判斷是否開啟花色）
    var patternSwitchBool = false
    var lepordPatternBool = false
    var giraffePatternBool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dinoHatImageView = UIImageView(image: UIImage(named: "dino_hat"))
        dinoHatImageView.frame = dinoHatView.bounds
        dinoHatImageView.contentMode = .scaleAspectFill
        dinoHatView.mask = dinoHatImageView
    }
    
    
    // 自定function區
    // 顯示顏色對應數值於Label上，原本value只有 0-1，乘以255讓數值較直觀（一般使用者選色是用 R: 30/255 不會記 0.12）
    func colorValueLabelShow(){
        redValueLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaValueLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    
    // 每次變動顏色後將對應的value儲存至原本變數中（帽子、背景、邊框各一）
    func hatColorValueSave(){
        hatRedValue = redSlider.value
        hatGreenValue = greenSlider.value
        hatBlueValue = blueSlider.value
        hatAlphaValue = alphaSlider.value
    }
    func bgColorValueSave(){
        bgRedValue = redSlider.value
        bgGreenValue = greenSlider.value
        bgBlueValue = blueSlider.value
        bgAlphaValue = alphaSlider.value
    }
    func borderColorValueSave(){
        borderRedValue = redSlider.value
        borderGreenValue = greenSlider.value
        borderBlueValue = blueSlider.value
        borderAlphaValue = alphaSlider.value
    }
    
    // 用已儲存進變數的Value（新的顏色數值）讓Slider跳至相對應的位置
    func hatColorSliderSet(){
        redSlider.setValue(hatRedValue, animated: true)
        greenSlider.setValue(hatGreenValue, animated: true)
        blueSlider.setValue(hatBlueValue, animated: true)
        alphaSlider.setValue(hatAlphaValue, animated: true)
    }
    func bgColorSliderSet(){
        redSlider.setValue(bgRedValue, animated: true)
        greenSlider.setValue(bgGreenValue, animated: true)
        blueSlider.setValue(bgBlueValue, animated: true)
        alphaSlider.setValue(bgAlphaValue, animated: true)
    }
    func borderColorSliderSet(){
        redSlider.setValue(borderRedValue, animated: true)
        greenSlider.setValue(borderGreenValue, animated: true)
        blueSlider.setValue(borderBlueValue, animated: true)
        alphaSlider.setValue(borderAlphaValue, animated: true)
    }
    
    // 確認花色Switch狀態（開啟時切換到其他SegmentedControl回來也還會開啟）
    func patternSwitchStatusCheck(){
        patternSwitch.isOn = patternSwitchBool
        patternSwitch.isEnabled = true
        lepardPatternButton.isHidden = !patternSwitchBool
        giraffePatternButton.isHidden = !patternSwitchBool
    }
    // 切換到調整背景及邊框的SegmentedControl時，Switch無法使用及開啟＋花紋按鈕隱藏
    func patternSwitchUnableAndOff(){
        patternSwitch.isOn = false
        patternSwitch.isEnabled = false
        lepardPatternButton.isHidden = true
        giraffePatternButton.isHidden = true
    }
    
    
    // IBAction Start
    // 按Segment control欄位選物件 觸發的所有動作
    @IBAction func segmentControlChanged(_ sender: Any) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat(hatRedValue), green: CGFloat(hatGreenValue), blue: CGFloat(hatBlueValue), alpha: CGFloat(hatAlphaValue))
            hatColorSliderSet()
            
            patternSwitchStatusCheck()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat(bgRedValue), green: CGFloat(bgGreenValue), blue: CGFloat(bgBlueValue), alpha: CGFloat(bgAlphaValue))
            bgColorSliderSet()
            
            patternSwitchUnableAndOff()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(borderRedValue), green: CGFloat(borderGreenValue), blue: CGFloat(borderBlueValue), alpha: CGFloat(borderAlphaValue))
            borderColorSliderSet()
            
            patternSwitchUnableAndOff()
        }
        colorValueLabelShow()
    }
    
    
    // 調顏色區（注意：每調整一次Slider就要儲存新的值進變數中）並用if else判斷要調哪個物件的顏色
    // Slider更動
    @IBAction func colorSliderChange(_ sender: Any) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
        colorValueLabelShow()
    }
    
    // 全部隨機按鈕
    @IBAction func elementAllRandomButtonClicked(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0.1...1)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.1...1))
            borderColorValueSave()
        }
        colorValueLabelShow()
    }
    
    // 各選項隨機按鈕（紅、綠、藍、透明度各一）
    @IBAction func redRandomButtonClicked(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        redValueLabel.text = String(format: "%.0f", redSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    @IBAction func greenRandomButtonClicked(_ sender: Any) {
        greenSlider.value = Float.random(in: 0...1)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    @IBAction func blueRandomButtonClicked(_ sender: Any) {
        blueSlider.value = Float.random(in: 0...1)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            borderColorValueSave()
        }
    }
    
    @IBAction func alphaRandomButtonClicked(_ sender: Any) {
        alphaSlider.value = Float.random(in: 0.1...1)
        alphaValueLabel.text = String(format: "%.1f", alphaSlider.value)
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            dinoHatView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            hatColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            dinoBackgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            bgColorValueSave()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            borderColorValueSave()
        }
    }
    
    // 重新調色按鈕（跳回該物件原本預設顏色）
    @IBAction func resetButtonClick(_ sender: UIButton) {
        if changeElementSegmentedControl.selectedSegmentIndex == 0{
            hatRedValue = 47/255
            hatGreenValue = 44/255
            hatBlueValue = 63/255
            hatAlphaValue = 1
            hatColorSliderSet()
            dinoHatView.backgroundColor = UIColor(red: 47/255, green: 44/255, blue: 63/255, alpha: 1)
            hatColorValueSave()
            
            patternSwitch.isEnabled = true
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 1{
            bgRedValue = 247/255
            bgGreenValue = 253/255
            bgBlueValue = 119/255
            bgAlphaValue = 1
            bgColorSliderSet()
            dinoBackgroundImageView.backgroundColor = UIColor(red: 247/255, green: 253/255, blue: 119/255, alpha: 1)
            bgColorValueSave()
            
            patternSwitchUnableAndOff()
        }
        else if changeElementSegmentedControl.selectedSegmentIndex == 2{
            borderRedValue = 0
            borderGreenValue = 0
            borderBlueValue = 0
            borderAlphaValue = 1
            borderColorSliderSet()
            dinoBackgroundImageView.layer.borderColor = UIColor.black.cgColor
            borderColorValueSave()
            
            patternSwitchUnableAndOff()
        }
        colorValueLabelShow()
    }
    
    
    // 調花色區
    // 開關On時顯示按鈕
    @IBAction func patternSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            lepardPatternButton.isHidden = false
            giraffePatternButton.isHidden = false
            patternSwitchBool = true
        }else{
            lepardPatternButton.isHidden = true
            giraffePatternButton.isHidden = true
            lepordPatternImageView.isHidden = true
            giraffePatternImageView.isHidden = true
            patternSwitchBool = false
            lepordPatternBool = false
            giraffePatternBool = false
        }
    }
    
    // 按下花紋按鈕顯示該花紋於帽子上（讓原本已隱藏的花紋圖片取消隱藏）
    @IBAction func lepordPatternButtonClick(_ sender: Any) {
        lepordPatternImageView.isHidden = false
        giraffePatternImageView.isHidden = true
        lepordPatternImageView.frame = dinoHatView.bounds
        dinoHatView.addSubview(lepordPatternImageView)
        lepordPatternBool = true
        giraffePatternBool = false
    }
    
    @IBAction func giraffePatternButtonClick(_ sender: Any) {
        giraffePatternImageView.isHidden = false
        lepordPatternImageView.isHidden = true
        giraffePatternImageView.frame = dinoHatView.bounds
        dinoHatView.addSubview(giraffePatternImageView)
        lepordPatternBool = false
        giraffePatternBool = true
    }
    
    
    // 圖片調整區
    // 選項開關On時顯示該選項的調節Slider
    @IBAction func pictureRadiusSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            radiusSlider.isHidden = false
            dinoBackgroundImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
            shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        }else{
            radiusSlider.isHidden = true
            dinoBackgroundImageView.layer.cornerRadius = 0
            
        }
    }
    
    @IBAction func pictureBoderSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            borderSlider.isHidden = false
            dinoBackgroundImageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        }else{
            borderSlider.isHidden = true
            dinoBackgroundImageView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func pictureShadowSwitchOn(_ sender: UISwitch) {
        if sender.isOn{
            shadowSlider.isHidden = false
            shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowView.layer.shadowColor = UIColor.darkGray.cgColor
            shadowView.layer.shadowOpacity = 0.5
        }else{
            shadowSlider.isHidden = true
            shadowView.layer.shadowOpacity = 0
        }
    }
    
    // 各選項Slider更動
    @IBAction func radiusSliderChange(_ sender: Any) {
        dinoBackgroundImageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    @IBAction func borderSliderChange(_ sender: Any) {
        dinoBackgroundImageView.clipsToBounds = true
        dinoBackgroundImageView.layer.borderWidth = CGFloat(borderSlider.value)
    }
    @IBAction func shadowSliderChange(_ sender: Any) {
        shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
    }
}

