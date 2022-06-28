//
//  ViewController.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import UIKit

protocol ViewControllerImpl: AnyObject {
    var apiCall: APICallImpl? { get }
    var pageNum: Int? { get set }
    var movie: Result? { get }
}

class ViewController: UIViewController, APICallable {
    var movie: Result?
    var movies: [Result] = []

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }

    func setData() {
        // let url = URL(string: "\(BaseURL)\(APIKey)")!
        let url = URL(string: "https://api.themoviedb.org/4/list/1?api_key=c51c01d6b237900097f895fb7fd09ed4&page=1")!
        APICall().getTask(with: url) { movies in
            self.movies = movies
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let movie = movies[indexPath.row]
        cell.setup(movie)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // ..
        return movies.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30) / 2, height: view.frame.height / 3)
        // return CGSize(width: 100, height: 300)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = Detail(nibName: "Detail", bundle: nil)

        movie = movies[indexPath.row]
        detail.movie = movie
        navigationController?.pushViewController(detail, animated: true)
    }
}
