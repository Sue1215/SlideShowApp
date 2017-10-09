//
//  DViewController.swift
//  SlideshowApp
//
//  Created by sue on 2017/10/04.
//  Copyright © 2017年 sue. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    
    @IBOutlet weak var imageBig: UIImageView!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBig.image = UIImage(named: imageName)

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
