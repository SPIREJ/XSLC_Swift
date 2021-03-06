//
//  XSDiscoverViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSDiscoverViewController: UIViewController {
    
    var bgScrollView: UIScrollView!
    var discoverView: XSDiscoverView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "发现"
        self.view.backgroundColor = kVCBgColor
        setUI()
    }

    // MARK: - SETUI
    func setUI() {
        self.view.addSubview(buildBgScrollView())
        
        discoverView = XSDiscoverView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 685))
        bgScrollView.addSubview(discoverView)
    }
    
    func buildBgScrollView() -> UIScrollView {
        bgScrollView = UIScrollView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight))
        bgScrollView.contentSize = CGSize(width: kDeviceWidth, height: 800)
        bgScrollView.backgroundColor = UIColor.white
        return bgScrollView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
