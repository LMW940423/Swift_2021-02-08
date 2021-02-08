//
//  ViewController.swift
//  Map
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit
import MapKit // MapKit View 를 위한 선언

class ViewController: UIViewController, CLLocationManagerDelegate {

    // CLLocationManagerDelegate => GPS
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // GPS 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 확인하기 위해 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        
        myMap.showsUserLocation = true // 위치 인증허가
        
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        // 0번은 GPS에 의한 위치, 1번 2번은 지정된 위치
        if sender.selectedSegmentIndex == 0{
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            // 둘리 뮤지엄
            setAnnotation(latitudeValue: 37.65243153, longitudeValue: 127.0276397, delta: 0.01, title: "둘리 뮤지엄", subTitle: "서울특별시 도봉구 1길 6")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "둘리 뮤지엄"
        }else if sender.selectedSegmentIndex == 2{
            // 서대문 형무소 역사관
            setAnnotation(latitudeValue: 37.57244171, longitudeValue: 126.9595412, delta: 0.01, title: "서대문 형무소 역사관", subTitle: "서울특별시 서대문구 통일로 251")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "서대문 형무소 역사관"
        }
    }
    
    // 위도와 경도에 대한 함수
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위도, 경도값으로 좌표 생성
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 얼만큼 확대할 것인지
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) // pLocation 중심으로 spanValue 만큼 확대
        
        myMap.setRegion(pRegion, animated: true) // MapView에 셋팅
        
        return pLocation // 좌표값 리턴
    }
    
    // 위치가 업데이트 되었을 때 지도의 위치를 표시하는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        // 지도 100배 확대 (0.01은 100배) 원래는 리턴값이 있다(좌표값)!
        var test = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        print("받아온 값 : \(test)")
    
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks?.first
            let country = pm!.country
            var address : String = country!
            
            if pm!.locality != nil{
                // 지번주소
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                // 현주소
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    // Pin 설치하기
    func setAnnotation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String, subTitle strSubTitle : String){
        let annotation = MKPointAnnotation() // pin
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        
        myMap.addAnnotation(annotation)
    }
    
}

