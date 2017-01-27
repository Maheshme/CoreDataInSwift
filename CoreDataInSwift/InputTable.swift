//
//  InputTable.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/26/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import UIKit

enum CellType {
    case KButtonContainer
    case KTextFeild
}

class InputTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [EntryDataSource]!

    init(frame: CGRect, style: UITableViewStyle, arrayOfData: [EntryDataSource]) {
        super.init(frame: frame, style: style)
        
        dataArray = Array.init(arrayOfData)
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.separatorStyle = UITableViewCellSeparatorStyle.singleLineEtched
        self.delegate = self
        self.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let dataSourceObj: EntryDataSource = dataArray[indexPath.row]
        
        guard let cell: DataEntryCell = tableView.dequeueReusableCell(withIdentifier: dataSourceObj.reUsableIdentifier) as! DataEntryCell! else {
            let cell: DataEntryCell = DataEntryCell.init(style: UITableViewCellStyle.default, reuseIdentifier:dataSourceObj.reUsableIdentifier , cellType: dataSourceObj.cellType, title: dataSourceObj.title)
            return cell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let title: UILabel = UILabel()
        title.textAlignment = NSTextAlignment.center
        title.text = "Fill in Anime Details"
        title.textColor = UIColor(red: 77.0/255.0, green: 98.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        title.font = UIFont.systemFont(ofSize: 25)
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: "H:[label]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["label": title])
        title.addConstraints(constraint)
        
        return title
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let saveButton: UIButton = UIButton()
        saveButton.setTitle("Save", for: UIControlState.normal)
        saveButton.backgroundColor = UIColor.green
        saveButton.tintColor = UIColor.white
        return saveButton
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
}

class DataEntryCell: UITableViewCell {
    
    var cellTextFeild: UITextField!
    var textButton: UIButton!
    var typeOfCell: CellType!
    var cellTitle, unSelectedTitle : String!
    var label: UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, cellType: CellType, title: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        typeOfCell = cellType
        cellTitle = title
        unSelectedTitle = String.init(format: "not %@", title)
        
        if cellType == .KTextFeild {
            cellTextFeild = UITextField.init()
            cellTextFeild.placeholder = title
            
            cellTextFeild.clearsOnBeginEditing = true
            cellTextFeild.textAlignment = NSTextAlignment.center
            self.contentView.addSubview(cellTextFeild)
        }
        else{
            self.selectionStyle = UITableViewCellSelectionStyle.none
            textButton = UIButton.init()
            textButton.backgroundColor = UIColor.black
            textButton.setTitle(unSelectedTitle, for: UIControlState.normal)
            textButton.setTitleColor(UIColor.white, for: UIControlState.normal)
            textButton.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
            self.contentView.addSubview(textButton)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if typeOfCell == CellType.KTextFeild {
            cellTextFeild.frame = contentView.bounds
        }
        else{
            textButton.frame = CGRect.init(x: self.contentView.frame.width*0.25, y:self.contentView.frame.size.height*0.2 , width: self.contentView.frame.width/2, height: self.contentView.frame.size.height*0.8)
            textButton.layer.cornerRadius = textButton.frame.size.height/2
        }
    }
    
    func buttonClicked(){
        
        if textButton.currentTitle == cellTitle{
            textButton.backgroundColor = UIColor.black
            textButton.setTitleColor(UIColor.white, for: UIControlState.normal)
            textButton.setTitle(unSelectedTitle, for: UIControlState.normal)
        }
        else{
            textButton.backgroundColor = UIColor.white
            textButton.setTitleColor(UIColor.black, for: UIControlState.normal)
            textButton.setTitle(cellTitle, for: UIControlState.normal)
        }
    }
}
