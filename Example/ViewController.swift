//
//  ViewController.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/9/22.
//

import UIKit


class ViewController: UIViewController{
 
    
 
    
var imageService = ImageService()
var vm = ViewModel()
    var filteredData = [Response]()
    var viewModels = [CustomTableViewCell]()
    var customTableView : UITableView = {
        let customTableView = UITableView()
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        customTableView.backgroundColor = .white
        customTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        return customTableView
    }()

    var searchController = UISearchController(searchResultsController: nil)
//    var searchBar : UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.searchBarStyle = UISearchBar.Style.default
//        searchBar.placeholder = " Search Here....."
//        return searchBar
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addSubViews()
        fetchTableViewData()
       
        customTableView.delegate = self
        customTableView.dataSource = self
        
    }
    
    func fetchTableViewData(){
        vm.fetchData2{ results in
                DispatchQueue.main.async {

                    self.customTableView.reloadData()
                }
        }
    }
    
   

    
    func configureUI(){
        
        view.backgroundColor = .white
       
        
        navigationItem.title = "Search Basketball Teams"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .purple
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Team"
        
      
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
      
       
        
    }

    
    
    func addSubViews(){
        
        view.addSubview(customTableView)
        customTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        customTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        customTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        customTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
   
    
}

