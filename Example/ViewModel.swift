//
//  ViewModel.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/9/22.
//

import Foundation

class ViewModel{
    
    
    var teamInfo: NBATeamsModel?
    var teamArray = [Response]()
    
//    func fetchData(with teamName: String, completion:@escaping ([Response]?)->()){
//
//        APIHandler.shared.APICall(with: teamName) { results in
//            switch results{
//            case .success(let data):
//
//                do{
//                    let jsonData = try JSONDecoder().decode(NBATeamsModel.self, from: data)
//                    self.setModel(model: jsonData)
//                    self.setArray(modelArr: jsonData.response)
//
//                    completion(jsonData.response)
//                }catch let jsonError{
//                    print(jsonError)
//                }
//
//            case .failure(let error):
//                print(error)
//
//            }
//        }
//    }
    
    func fetchData2(completion:@escaping ([Response])->()){
        
        APIHandler.shared.APICall2{ results in
                   switch results{
                   case .success(let data):
       
                       do{
                           let jsonData = try JSONDecoder().decode(NBATeamsModel.self, from: data)
                           self.setModel(model: jsonData)
                           self.setArray(modelArr: jsonData.response ?? [])
                           
       
                           completion(self.teamArray  )
                       }catch let jsonError{
                           print(jsonError)
                       }
       
                   case .failure(let error):
                       print(error)
       
                   }
               }
    }
    
    func setModel(model:NBATeamsModel?){
        self.teamInfo = model
    }
    
    func setArray(modelArr:[Response]){
        self.teamArray = modelArr
    }
    
    func getTeams()->[Response]{
        return self.teamInfo?.response ?? []
    }
    
    func getTeamCount()->Int{
        return self.teamArray.count
    }
    
    func getTeamName(index:Int)->String{
        return self.teamArray[index].name ?? ""
    }
    
    func getTeamLogName(index:Int)->String{
        return self.teamArray[index].logo ?? ""
    }
    
    func getTeamLogoURL(index:Int)->URL?{
        guard let url = URL(string: getTeamLogName(index: index)) else {return nil}
       return url
    }
    
  
    
}
