//
//  ViewController.swift
//  Quiz_13
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // 선생님 방법
    let numPages = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 선생님 방법
//        pageControl.numberOfPages = numPages
//        pageControl.currentPage = 0
//        pageControl.pageIndicatorTintColor = UIColor.green
//        pageControl.currentPageIndicatorTintColor = UIColor.red

//        lblNumber.text = String(pageControl.currentPage + 1)
//        lblColor()
        
        // 초기값 설정
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        lblNumber.text = "1"
        lblNumber.textColor = UIColor.red
    }

    @IBAction func pageControlAction(_ sender: UIPageControl) {
        lblNumber.text = "\(pageControl.currentPage + 1)"
        lblNumber.textColor = changeColor(number: pageControl.currentPage + 1)
        
        // 선생님 방법
//        lblNumber.text = String(pageControl.currentPage + 1)
//        lblColor()
    }
    
    // text 색깔 바꾸는 함수
    func changeColor(number : Int) -> UIColor{
        var uiColor = UIColor.red
        
        if number % 2 == 0{
            uiColor = UIColor.blue
        }else{
            uiColor = UIColor.red
        }
        return uiColor
    }
    
    // 선생님 방법
//    func lblColor(){
//        if Int(lblNumber.text!)! % 2 == 0{
//            lblNumber.textColor = UIColor.blue
//        }else{
//            lblNumber.textColor = UIColor.red
//        }
//    }
    
}

