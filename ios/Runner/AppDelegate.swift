import UIKit
import Flutter
import WebKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
  let webViewChannel = FlutterMethodChannel(
      name: "example.com/channel",
      binaryMessenger: controller.binaryMessenger
    )
   webViewChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      // Handle the call
      if call.method == "openWebView" {
        if let args = call.arguments as? [String: Any], let url = args["url"] as? String {
          self.openWebView(url: url)
          result(nil)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "URL not provided", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

 private func openWebView(url: String) {
    let webViewController = WebViewController()
    webViewController.urlString = url
    self.window?.rootViewController?.present(webViewController, animated: true, completion: nil)
  }

}


class WebViewController: UIViewController, WKNavigationDelegate {
  var webView: WKWebView!
  var urlString: String?

  override func viewDidLoad() {
    super.viewDidLoad()

    webView = WKWebView(frame: self.view.frame)
    webView.navigationDelegate = self
    self.view.addSubview(webView)

    if let urlStr = urlString, let url = URL(string: urlStr) {
      let request = URLRequest(url: url)
      webView.load(request)
    }

    let closeButton = UIButton(frame: CGRect(x: 20, y: 40, width: 80, height: 40))
    closeButton.setTitle("Close", for: .normal)
    closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
    self.view.addSubview(closeButton)
  }

  @objc func closeWebView() {
    self.dismiss(animated: true, completion: nil)
  }
}