//
//  WebViewKit.swift
//  ExportWebSite Extension
//
//  Created by Angelos Staboulis on 15/7/24.
//

import Foundation
import WebKit
class WebViewKit:NSObject,WKNavigationDelegate{
    var saveURL:String
    var loadURL:String
    var webView = WKWebView()
    init(saveURL:String,loadURL:String) {
        self.saveURL = saveURL
        self.loadURL = loadURL
        super.init()
        webView.navigationDelegate = self
    }
    func loadWebURL(){
        webView.load(URLRequest(url:URL(string: self.loadURL)!))
    }
    func saveArchive(){
        DispatchQueue.main.async{
            self.webView.createWebArchiveData { result in
                switch result {
                case .success(let data):
                    FileManager.default.createFile(atPath: self.saveURL, contents: data)
                case .failure(let failure):
                    debugPrint("failure=",failure)
                }
            }
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           saveArchive()
        
    }
   
 
}
