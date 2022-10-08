//
//  ViewController.swift
//  ios-dca-calculator
//
//  Created by Piotr Szerszeń on 08/10/2022.
//

import UIKit
import Combine

class SearchTableViewController: UITableViewController {
    
    private let apiService: ApiService = ApiService()
    private var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: self)
//        sc.searchResultsController = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Enter a company name or symbol"
        sc.searchBar.autocapitalizationType = .allCharacters
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        performSearch(keywords: "S&B")
    }

    private func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
    
    private func performSearch(keywords: String?) {
        if let keywords {
            apiService.fetchSymbolsPublisher(keywords: keywords).sink { completion in
                switch completion {
                    case .failure(let error): print(error.localizedDescription)
                    case .finished: break
                }
            } receiveValue: { response in
                print(response)
            }.store(in: &subscribers)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
