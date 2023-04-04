//
//  ViewController.swift
//  dcard
//
//  Created by 林家麒 on 2023/4/3.
//


import UIKit

class FistScene: UIViewController {
    var tableView = UITableView()
    var albums = [Album]() // 創建一個空的數組以存儲 API 的數據
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchAlbums()
    }
    
    // 設置表格視圖
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.pin(to:view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        // 註冊自定義單元格
        tableView.register(VIdeoCell.self, forCellReuseIdentifier: "VideoCell")
    }
    
    // 加載 API 數據
    func fetchAlbums(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5") else{return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("urlsession error: \(error.localizedDescription)")
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    self.albums = result.results
                    DispatchQueue.main.async { // 在主線程更新UI
                        self.tableView.reloadData()
                    }
                } catch {
                    print("decoding error \(error)")
                }
            }
        }.resume()
    }
}

// 實現 UITableViewDelegate 和 UITableViewDataSource 協議
extension FistScene: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VIdeoCell
        let album = albums[indexPath.row]
        cell.videoTitleLabel.text = album.collectionName
        // 根據你的需求設置圖像
        // cell.videoImageView.image = ...
        return cell
    }
}



