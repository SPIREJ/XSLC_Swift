//
//  XSInvestViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSInvestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let headHeight:CGFloat = 120.0
    let IDENTIFY = "CELLIDENTIFY"
    let IDHEADER = "HEADERIDENTIFY"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "理财"
        self.setUI()
    }
    
    // MARK: - ACTION
    func secHeaderClick() {
        let planListVC = XSPlanListViewController()
        planListVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(planListVC, animated: true)
    }
    
    // MARK: - UITableView Delegate & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var secHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: IDHEADER)
        if (secHeaderView == nil) {
            secHeaderView = XSInvestSecHeaderView.init(reuseIdentifier: IDHEADER)
            secHeaderView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(XSInvestViewController.secHeaderClick)))
            secHeaderView?.isUserInteractionEnabled = true
        }
        return secHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:XSPlanListCell = tableView.dequeueReusableCell(withIdentifier: "PlanListCell") as! XSPlanListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let plandetailsVC = XSPlandetailsViewController()
        plandetailsVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(plandetailsVC, animated: true)
    }
    
    //MARK: - Set UI
    func setUI() {
        let headIcon = UIImageView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: headHeight))
        headIcon.image = UIImage(named: "investBg")
        
        let title = buildLabel(rect: CGRect.init(x: 0, y: 25, width: kDeviceWidth, height: 18), labelColor: UIColor.clear, text: "工资理财", textColor: UIColor.white, fontSize: 18, align: .center)
        title.font = UIFont.boldSystemFont(ofSize: 18)
        
        let desc = buildLabel(rect: CGRect.init(x: 0, y: title.maxY + 15, width: kDeviceWidth, height: 12), labelColor: UIColor.clear, text: "每月工资定存，赚取自己的年终奖！", textColor: UIColor.white, fontSize: 12, align: .center)
        let joiner = buildLabel(rect: CGRect.init(x: 0, y: desc.maxY + 16, width: kDeviceWidth, height: 18), labelColor: UIColor.clear, text: "已有 2763 人加入", textColor: UIColor.white, fontSize: 14, align: .center)
        
        headIcon.addSubview(title)
        headIcon.addSubview(desc)
        headIcon.addSubview(joiner)
        
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight), style: UITableViewStyle.grouped)
        tableView.register(UINib.init(nibName: "XSPlanListCell", bundle: nil), forCellReuseIdentifier: "PlanListCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headIcon
        self.view.addSubview(tableView)
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
