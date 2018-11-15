//
//  AddCustomerViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData
class AddCustomerViewController: UIViewController {

    // MARK: Outlets
    // ---------------------
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
       var x:String = ""
    
      var context:NSManagedObjectContext!
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext

        // HINT HINT HINT HINT HINT
        // HINT HINT HINT HINT HINT
        // Code to create a random 4 digit string
     
        repeat {
            // Create a string with a random number 0...9991
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Actions
    // ---------------------
    
    @IBAction func createAccountPressed(_ sender: Any) {
        print("you pressed the create account button!")
        let c = Customer(context: self.context)
        c.name = nameTextBox.text!
        c.balance = startingBalanceTextBox.text!
        c.id = x
        
        do {
            // Save the user to the database
            // (Send the INSERT to the database)
            try self.context.save()
            print("Saved to database!")
            messageLabel.text = x
        }
        catch {
            print("Error while saving to database")
        }
        
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
