//
//  ViewController.swift
//  Quiz_13-01
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기값 설정
        pageControl.numberOfPages = 4 // page 개수 설정
        pageControl.currentPage = 0 // 현재 페이지 설정
        
    }
    
    // 위도와 경도에 대한 함수
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위도, 경도값으로 좌표 생성
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 얼만큼 확대할 것인지
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) // pLocation 중심으로 spanValue 만큼 확대
        
        myMap.setRegion(pRegion, animated: true) // MapView에 셋팅
        
        return pLocation // 좌표값 리턴
    }
    
    // Pin 설치하기
    func setAnnotation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String, subTitle strSubTitle : String){
        let annotation = MKPointAnnotation() // pin
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        
        myMap.addAnnotation(annotation)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        let currentPage = pageControl.currentPage
        
        if currentPage == 0{ // 혜화문
            setAnnotation(latitudeValue: 37.5878892, longitudeValue: 127.0037098, delta: 0.01, title: "혜화문", subTitle: "혜화문입니다.")
        }else if currentPage == 1{ // 흥인지문
            setAnnotation(latitudeValue: 37.5711907, longitudeValue: 127.009506, delta: 0.01, title: "흥인지문", subTitle: "흥인지문입니다.")
        }else if currentPage == 2{ // 창의문
            setAnnotation(latitudeValue: 37.5926027, longitudeValue: 126.9664771, delta: 0.01, title: "창의문", subTitle: "창의문입니다.")
        }else if currentPage == 3{ // 숙정문
            setAnnotation(latitudeValue: 37.5956584, longitudeValue: 126.9810576, delta: 0.01, title: "숙정문", subTitle: "숙정문입니다.")
        }
    }
    
}

