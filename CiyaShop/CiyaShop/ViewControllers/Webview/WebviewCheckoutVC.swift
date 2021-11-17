//
//  WebviewVC.swift
//  CiyaShop
//
//  Created by Apple on 06/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import WebKit
import CiyaShopSecurityFramework
import SwiftyJSON

class WebviewCheckoutVC: UIViewController,WKUIDelegate,WKNavigationDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var wkWebView: WKWebView!
    
    
    //Variables
    
    
    var dictCart : [AnyHashable : Any]?
    
    var url : String?
    var urlThankyou : String?
    var urlThankYouEndPoint : String?
    
    var isBuyNow : Bool = false
    
    var isReload : Bool = true
    
    //MARK: - Life Cycle methods
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setThemeColors()
        setLogo()
        setupWebview()
    }
    
    
    // MARK: - Themes Methods
    func setThemeColors() {
        self.view.setBackgroundColor()
        btnBack.tintColor =  secondaryColor
        
        
    }
    
    func setLogo() {
        if appLogo != "" {
            self.imgLogo.sd_setImage(with: appLogo.encodeURL() as URL) { (image, error, cacheType, imageURL) in
                if (image == nil) {
                    self.imgLogo.image = UIImage(named: "appLogo")
                } else {
                    self.imgLogo.image = image
                }
            }
        } else {
            self.imgLogo.image = UIImage(named: "appLogo")
        }
    }
    
    // MARK: - Webview Methods
    func setupWebview() {
        //Webview
        wkWebView.allowsBackForwardNavigationGestures = true
        wkWebView.scrollView.bouncesZoom = false
        wkWebView.scrollView.delegate = self
        wkWebView.navigationDelegate = self
        
        //Reuest loading
        let requestUrl = URL(string: self.url!)
        let request = NSMutableURLRequest(url: requestUrl!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 5)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        dictCart!["os"] = "ios"
        
        

        var jsonData : Data?
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dictCart!, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }

        var jsonString = ""

        if jsonData != nil {
            jsonString = String(data: jsonData!, encoding: .utf8)!
        } else {
            //Error in json conversion
        }
        
        request.httpBody = jsonString.data(using: .utf8)
        
//        showLoader()
        wkWebView.load(request as URLRequest)
        
    }
    
    
    // MARK: - WKWebView Delegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoader()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoader()
        if isReload {
            wkWebView.reload()
            isReload = false
        }
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        hideLoader()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let javaScript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);"
        wkWebView.evaluateJavaScript(javaScript, completionHandler: nil)
    }
    
    // MARK: - Button Clicked
    
    @IBAction func btnBackClicked(_ sender: Any) {
        
        if wkWebView.canGoBack {
            wkWebView.goBack()
        } else {
            logoutUser()
        }
        
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
                
        let request = navigationAction.request
        let url = request.url?.absoluteString
        let arrUrlQueryStrings = url?.components(separatedBy: "?")
        
        if arrUrlQueryStrings!.count > 0 {
            
            let urlLoad = arrUrlQueryStrings![0] as String
            
            for option in arrCheckoutOptions {
                var strUrl = option.string
                
                if strUrl?.hasPrefix("/") ?? false && (strUrl?.count ?? 0) > 1 {
                    strUrl = (strUrl as NSString?)?.substring(from: 1)
                }
                
                if strUrl?.hasSuffix("/") ?? false && (strUrl?.count ?? 0) > 1 {
                    strUrl = (strUrl as NSString?)?.substring(to: (strUrl?.count ?? 0) - 1)
                }
                if strUrl == "" {
                    continue
                } else if urlLoad.contains(strUrl!) {
                    
                    // Facebook Pixel for Product Purchased
                    var arrMyCart : Array = Array<JSON>()
                    
                    if isBuyNow {
                        arrMyCart = arrCart
                    } else {
                        arrMyCart = arrBuyNow
                    }
                    
                    for product in arrMyCart {
                        FacebookHelper.logPurchasedEvent(numItems: product["qty"].intValue, contentId: product["id"].stringValue, contentType: product["name"].stringValue, currency: strCurrencySymbol, price: product["price"].double ?? 0)
                    }
                    // End facebook pixel
                    self.redirectToOrderSuccess()
                }
            }
            if url!.contains("app_checkout_order_id") {
                //                var items = url?.components(separatedBy: "app_checkout_order_id=")
                //                var orderId = items![0]
                
                //                print("orderId : " + orderId)
                self.redirectToOrderSuccess()
            }
            
        }
        decisionHandler(.allow)
    }
    
    
    func redirectToOrderSuccess() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            DispatchQueue.main.async {
                hideLoader()
                removeAllFromCart()
                self.logoutUser()
                self.navigationController?.popViewController(animated: true)
                NotificationCenter.default.post(name: Notification.Name(rawValue: ORDER_SUCCESS), object: nil)
                
            }
        }
    }
    // MARK: - Scrollview Delegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
        scrollView.setContentOffset(.zero, animated: false)
    }
    
    
    // MARK: - Api Calling
    
    func logoutUser() {
        showLoader()

        CiyaShopAPISecurity.userLogout { (success, message, responseData) in
            hideLoader()
            let jsonReponse = JSON(responseData!)
            if success {
                if jsonReponse["status"] == "success" {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    
}
