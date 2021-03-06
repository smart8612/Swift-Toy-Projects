//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright Β© yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFruitLabels()
        setJuiceButtons()
        updateFruitCount()
        registerNotificationCenter()
    }
    
    @IBAction private func unwindAction(unwindSegue: UIStoryboardSegue) { }
    
    @IBOutlet private var fruitEmojiLabels: [UILabel]!
    
    @IBOutlet private var fruitCountLabels: [FruitLabel]!
    
    @IBOutlet private var juiceOrderButtons: [JuiceButton]!
    
    @IBAction private func clickOrderButton(_ sender: JuiceButton) {
        do {
            guard let wantedJuice = sender.kindOfJuice else {
                throw StoryboardError.notFoundID(self, .button)
            }
            tryOrder(juice: wantedJuice)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    private func setFruitLabels() {
        for index in fruitEmojiLabels.indices {
            let fruits: [(emoji: String, name: Fruits)] = [("π", .strawberry), ("π", .banana), ("π", .pineapple), ("π₯", .kiwi), ("π₯­", .mango)]
            
            fruitEmojiLabels[index].text = fruits[index].emoji
            fruitCountLabels[index].kindOfFruit = fruits[index].name
        }
    }
    
    private func setJuiceButtons() {
        for (index, button) in juiceOrderButtons.enumerated() {
            let juiceArrange: [Juice] = [.strawberryBananaJuice, .kiwiMangoJuice, .strawberryJuice, .bananaJuice, .pineappleJuice, .kiwiJuice, .mangoJuice]
            
            button.setTitle("\(juiceArrange[index].translatedDescription) μ£Όλ¬Έ", for: .normal)
            button.kindOfJuice = juiceArrange[index]
        }
    }
    
    private func registerNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: .changedInventory,
            object: nil)
    }
    
    private func tryOrder(juice: Juice) {
        if let madejuice = juiceMaker.order(juice: juice) {
            showAlert(title: "μ£Όμ€ μ μ‘° μλ£", message: "\(madejuice.translatedDescription) μ μ‘°κ° μλ£λμμ΅λλ€.")
        } else {
            showAlert(title: "μ£Όμ€ μ μ‘° μ€ν¨", message: "μ¬λ£κ° λͺ¨μλΌμ. μ¬κ³ λ₯Ό μμ ν κΉμ?") { _ in
                self.presentModifyView()
            }
        }
    }
    
    private func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "νμΈ", style: .default, handler: handler)
        let alertCancel = UIAlertAction(title: "μ·¨μ", style: .cancel, handler: nil)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc
    private func updateFruitCount() {
        do {
            for (fruit, fruitCount) in FruitStore.shared.fruitInventory {
                guard let fruitCountLabel = fruitCountLabels.filter({
                    fruit == $0.kindOfFruit }).first else {
                        throw StoryboardError.notFoundView(self, .label)
                    }
                fruitCountLabel.text = String(fruitCount)
            }
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
    }
    
    private func presentModifyView() {
        let ModifyInventoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModifyInventory")
        
        present(ModifyInventoryVC, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: .changedInventory,
            object: nil
        )
    }
}
