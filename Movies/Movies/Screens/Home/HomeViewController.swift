//
//  ViewController.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import UIKit

protocol HomeViewController: AnyObject {
    var viewModel: HomeViewModel? {get set}
    func update(movies: [MovieResult])
}

class HomeViewControllerImpl: UIViewController, APICallable, HomeViewController {
    var viewModel: HomeViewModel?
    
    var movie: MovieResult?
    var movies: [MovieResult] = []

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        
        viewModel?.setData()
        
    }
    
    func update(movies: [MovieResult]) {
        self.movies.append(contentsOf: movies)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension HomeViewControllerImpl: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let movie = movies[indexPath.row]
        cell.setup(movie)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
}

extension HomeViewControllerImpl: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30) / 2, height: view.frame.height / 3)
    }
}

extension HomeViewControllerImpl: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detail = DetailsViewController(nibName: "DetailViewController", bundle: nil)
//        movie = movies[indexPath.row]
//        detail.movie = movie
//        navigationController?.pushViewController(detail, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            viewModel?.setData()
        }
    }
}
