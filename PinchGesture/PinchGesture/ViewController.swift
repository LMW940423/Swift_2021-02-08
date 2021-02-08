//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pinch Setup (확대/축소)
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
   
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1 // 확대 후 원상태의 값인 1로 세팅
    }


}

