//
//  WebView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import WebKit

class WebView: UIViewController, WKNavigationDelegate {

  @IBOutlet var webView: WKWebView!
  var urlString: String = ""

  override func loadView() {
      webView = WKWebView()
      webView.navigationDelegate = self
      view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let url = URL(string: urlString)!
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
  }
}
