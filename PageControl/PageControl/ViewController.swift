//
//  ViewController.swift
//  PageControl
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl! // 속성 변경을 위해 정의
    
    // 이미지 정의
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count // page 개수 설정
        pageControl.currentPage = 0 // 현재 페이지 설정
        pageControl.pageIndicatorTintColor = UIColor.green // 체크 안된 페이지컨트롤 색깔
        pageControl.currentPageIndicatorTintColor = UIColor.red // 체크된 페이지컨트롤 색깔
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage]) // 바뀌는 페이지에 따라 사진이 바뀌게 하기!
        
    }

    
}

