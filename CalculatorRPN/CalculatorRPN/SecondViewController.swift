//
//  SecondViewController.swift
//  CalculatorRPN
//
//  Created by Starrk on 08/03/2016.
//  Copyright © 2016 Starrk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    
    var files = Array<String>()

    override func viewDidLoad() {
        
        super.viewDidLoad()
       // print("Testing")
        for file in files
        {
            print("Tape output: " + file)
            self.textBox.text! += file + "\n"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
