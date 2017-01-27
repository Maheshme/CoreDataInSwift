//
//  ViewController.swift
//  CoreDataInSwift
//
//  Created by Mahesh.me on 1/20/17.
//  Copyright © 2017 Mahesh.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var entryView: InputTable!
    
   override func loadView() {
        self.view = UIView.init(frame: UIScreen.main.bounds)
        self.view.backgroundColor = UIColor.white
    
    
        entryView = InputTable.init(frame: CGRect.zero, style: UITableViewStyle.grouped, arrayOfData: getDataForEntry())
        self.view.addSubview(entryView)
        
//        do{
//            _ = try Anime.getDetailsOfAnime(name: "Berserek")
//        }catch coreDataError.wrongData{
//            print("failed")
//        }catch coreDataError.noData{
//             print("failed")
//        }catch{
//            print("Un-known")
//        }
    }
    
    override func viewWillLayoutSubviews() {
        entryView.frame = CGRect.init(x: self.view.frame.size.width*0, y: self.view.frame.size.height*0.1, width: self.view.frame.size.width, height: self.view.frame.size.height*0.9)
    }
    
    func getDataForEntry() -> [EntryDataSource]{
        var arr: [EntryDataSource] = Array.init()
        
        let data1: EntryDataSource = EntryDataSource.init()
        data1.cellType = CellType.KTextFeild
        data1.title = "Name"
        data1.reUsableIdentifier = "cellTextFeild"
        arr.append(data1)
        
        let data2: EntryDataSource = EntryDataSource.init()
        data2.cellType = CellType.KTextFeild
        data2.title = "Episodes"
        data2.reUsableIdentifier = "cellTextFeild"
        arr.append(data2)
        
        let data3: EntryDataSource = EntryDataSource.init()
        data3.cellType = CellType.KTextFeild
        data3.title = "Gener"
        data3.reUsableIdentifier = "cellTextFeild"
        arr.append(data3)
        
        let data4: EntryDataSource = EntryDataSource.init()
        data4.cellType = CellType.KTextFeild
        data4.title = "Rating"
        data4.reUsableIdentifier = "cellTextFeild"
        arr.append(data4)
        
        let data5: EntryDataSource = EntryDataSource.init()
        data5.cellType = CellType.KButtonContainer
        data5.title = "Dubbed"
        data5.reUsableIdentifier = "cellButton"
        arr.append(data5)
        
        let data6: EntryDataSource = EntryDataSource.init()
        data6.cellType = CellType.KButtonContainer
        data6.title = "Subbed"
        data6.reUsableIdentifier = "cellButton"
        arr.append(data6)
        
        let data7: EntryDataSource = EntryDataSource.init()
        data7.cellType = CellType.KButtonContainer
        data7.title = "Airing"
        data7.reUsableIdentifier = "cellButton"
        arr.append(data7)
        
        return arr
    }
}

class EntryDataSource: NSObject {
    var cellType: CellType!
    var title, reUsableIdentifier: String!
}

