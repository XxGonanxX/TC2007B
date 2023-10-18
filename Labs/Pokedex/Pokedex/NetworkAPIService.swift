//
//  NetworkAPIService.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 16/10/23.
//

import Foundation
import Alamofire

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    
    func getPokedex(url: URL, Limit: Int) async -> Pokedex? {
        let parameters : Parameters = [
            "limit" : Limit
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result{
        case.success(let data):
            do {
                return try JSONDecoder().decode(Pokedex.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    // Cada una de estas funciones son para las llamadas del API, esta específicamente es la de la info de cada Pokemon
    func getPokemonInfo(url: URL) async -> Perfil? {
        let taskRequest = AF.request(url, method: .get).validate()
        
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do{
                return try JSONDecoder().decode(Perfil.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
}
