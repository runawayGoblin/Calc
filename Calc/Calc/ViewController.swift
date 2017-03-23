//
//  ViewController.swift
//  Calc
//
//  Created by MoYo on 3/22/17.
//  Copyright © 2017 Morgan Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numOnScreen:Double = 0;
    var prevNum:Double = 0;
    var doingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        
        if doingMath == true{
            label.text = String(sender.tag - 1)
            
            numOnScreen = Double(label.text!)!
            doingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag - 1)
            
            numOnScreen = Double(label.text!)!
        }
        
        //label.text = label.text! + String(sender.tag - 1)
        
       // numOnScreen = Double(label.text!)!
        
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{//either, + - * / was pressed
            prevNum = Double(label.text!)!
            
            if sender.tag == 12{ //divide
                 label.text = "/";
                
            }
            else if sender.tag == 13{//mulitply
                 label.text = "*";
            }
            else if sender.tag == 14{ // minus
                 label.text = "-";
                
            }
            else if sender.tag == 15{ // plus
                
                
                label.text = "+";
                
            }
            
            operation = sender.tag
            doingMath = true;
        }
        else if sender.tag == 16{
            if operation == 12{
                label.text = String(prevNum / numOnScreen)
            }
            else if operation == 13{
                label.text = String(prevNum * numOnScreen)
            }
            else if operation == 14{
                label.text = String(prevNum - numOnScreen)
            }
            else if operation == 15{
                label.text = String(prevNum + numOnScreen)
            }
        }
        else if sender.tag == 11{
            label.text = ""
            prevNum = 0;
            numOnScreen = 0;
            operation =  0;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

