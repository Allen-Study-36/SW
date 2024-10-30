//
//  ViewController.swift
//  TableView
//
//  Created by 강소원 on 10/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray: [Movie] = []
    var movieDataManager = MovieDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "영화목록"
        setupTableView()
        setupDatas()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
    }
    
    func setupDatas() {
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()  // 일반적으로는 서버에 요청 (데이터 업데이트)
        moviesArray = movieDataManager.getMovieData()  // 다시 데이터 받아서 뷰컨의 배열에 저장
        tableView.reloadData()   // 테이블뷰를 다시 불러오기
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movieImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.descriptionLabel.numberOfLines = 0
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath
            
            detailVC.movieData = moviesArray[index.row]
        }
    }
}
