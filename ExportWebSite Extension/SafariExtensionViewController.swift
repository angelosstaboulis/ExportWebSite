//
//  SafariExtensionViewController.swift
//  ExportWebSite Extension
//
//  Created by Angelos Staboulis on 15/7/24.
//

import SafariServices
import PDFKit
class SafariExtensionViewController: SFSafariExtensionViewController {
    var webView:WebViewKit!
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:515, height:250)
        return shared
    }()
    
    @IBOutlet weak var txtSourceURL: NSTextField!
    
    @IBOutlet weak var txtDEstinationURL: NSTextField!
    
    @IBOutlet weak var CmbList: NSComboBox!
    override func viewDidLoad() {
            super.viewDidLoad()
            webView = WebViewKit(saveURL: "", loadURL: "")
        
    }
    func showAlertBox(){
        let alert = NSAlert()
        alert.alertStyle = .informational
        alert.messageText = "Information Message"
        alert.informativeText = "File was created!!!"
        alert.runModal()
    }
    @IBAction func CmbExport(_ sender: Any) {
        webView.loadURL = txtSourceURL.stringValue
        webView.loadWebURL()
        webView.saveURL = txtDEstinationURL.stringValue
        webView.saveArchive()
        showAlertBox()
    }
    
    
}
