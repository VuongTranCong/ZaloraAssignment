//
//  VTTableView.swift
//  Talaha
//
//  Created by Admin Full on 11/16/16.
//  Copyright © 2016 Home. All rights reserved.
//

import UIKit

@objc protocol VTTableViewDelegate {
    func vtTableView(_ tableView: VTTableView, numberOfRowsInSection section: Int) -> Int
    func vtTableView(_ tableView: VTTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func vtTableView(_ tableView: VTTableView, isSectionLoadingMore section: Int) -> Bool
    @objc optional func vtTableView(_ tableView: VTTableView, didSelectRowAt indexPath: IndexPath)
}

class VTTableView: UITableView {
    var  emptyLabel: UILabel!
    var countReload: Int = 0
    @IBInspectable var enableRefreshing: Bool = false
    @IBInspectable var dynamicCellHeight: Bool = false
    var loadingView: LoadingView!
    var refreshIcon: UIRefreshControl!
    var refreshCallback:(()->Void)!
    @IBInspectable var messageNoData: String = NSLocalizedString("No data is currently available.", comment: "")
    var vtDelegate: VTTableViewDelegate? {
        didSet {
            self.delegate = self
            self.dataSource = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        countReload = 0;
        
        if (enableRefreshing == true) {
            refreshIcon = UIRefreshControl()
            self.addSubview(refreshIcon)
            refreshIcon.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        }
        
        if (dynamicCellHeight == true) {
            self.estimatedRowHeight = 44.0 ;
            self.rowHeight = UITableView.automaticDimension;
        }
    }
    
   @objc func handleRefresh () {
        self.refreshCallback?()
    }
    
    func endRefresh () {
        refreshIcon.endRefreshing()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        emptyLabel?.frame = CGRect(x: 10, y: 0, width: self.frame.size.width - 20, height: self.frame.size.height)
    }
    
    override func reloadData() {
        super.reloadData()
        
        guard countReload != 0 else {
            countReload += 1
            return
        }
        
        if (self.visibleCells.count == 0) {
            if (emptyLabel == nil) {
                emptyLabel = UILabel()
                emptyLabel.textAlignment = NSTextAlignment.center
                emptyLabel.text = messageNoData
                emptyLabel.font = UIFont(name: kFontOpenSansRegular, size: 14)
                emptyLabel.textColor = UIColor.darkGray

                self.addSubview(emptyLabel)
            }
            emptyLabel.isHidden = false;
        } else {
            if (emptyLabel != nil) {
                emptyLabel.isHidden = true;
            }
        }
        if enableRefreshing {
            endRefresh()
        }
    }
}

extension VTTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = vtDelegate?.vtTableView(self, numberOfRowsInSection: section) ?? 0
        if vtDelegate?.vtTableView(self, isSectionLoadingMore: section) ?? false == false {
            return count
        }
        return count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if vtDelegate?.vtTableView(self, isSectionLoadingMore: indexPath.section) ?? false == false {
            let cell = vtDelegate?.vtTableView(self, cellForRowAt: indexPath) ?? UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "defaultcell")
            return cell
        } else {
            let cell = vtDelegate?.vtTableView(self, cellForRowAt: indexPath) ?? UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "defaultcell")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if vtDelegate?.vtTableView(self, isSectionLoadingMore: indexPath.section) ?? false == false {
            vtDelegate?.vtTableView?(self, didSelectRowAt: indexPath)
        } else {
            let count = vtDelegate?.vtTableView(self, numberOfRowsInSection: indexPath.section) ?? 0
            if indexPath.row < count {
                vtDelegate?.vtTableView?(self, didSelectRowAt: indexPath)
            }
        }
    }
}
