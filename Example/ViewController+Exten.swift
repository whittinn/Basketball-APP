//
//  ViewController+Exten.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/9/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    

    
    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
           
//        if text == "" {
//            self.vm.getTeamCount()
//        }else{
//
//            self.vm.teamArray = self.vm.teamArray.filter { (team) -> Bool in
//
//                return (team.name?.contains(text))!
//
//            }
//
//        }
//        self.customTableView.reloadData()

        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             
       
        if searchText.isEmpty == true {
            
            vm.fetchData2 { data in
                DispatchQueue.main.async {
                    self.customTableView.reloadData()
                }
            }
           
              
        }else{
            
            if searchText.isEmpty == false{
                self.vm.teamArray = self.vm.teamArray.filter { (team) -> Bool in
                
                return (team.name?.contains(searchText))!
               
                }
            }
        
        customTableView.reloadData()
    }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return vm.getTeamCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        imageService.downloadImage(with: vm.getTeamLogoURL(index: indexPath.row) ?? URL(fileURLWithPath: "")) { image in
            cell.teamImg.image = image
        }
        cell.word.text = vm.getTeamName(index: indexPath.row)
        return cell
    }
    
    
    
    
    

    
}
