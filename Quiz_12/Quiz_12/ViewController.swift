//
//  ViewController.swift
//  Quiz_12
//
//  Created by 이민우 on 2021/02/08.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self // toolbar button들의 history를 기억하고 관리
        
        // 초기화면 : www.naver.com
        loadWebPage(url: "http://127.0.0.1:8080/test/ResponseAge_01.jsp")
    }
    
    func loadWebPage(url : String) {
        let myUrl = URL(string: url) // url 타입으로 변경
        let myRequest = URLRequest(url: myUrl!) // Requesting
        webView.load(myRequest) // 화면 띄우기
    }
    
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating() // 시작
        myIndicator.isHidden = false // 숨길지 말지
    }
    
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating() // 종료
        myIndicator.isHidden = true // 숨겨라
    }
    
    // Error 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    
    // ---------------

    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnFoward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

