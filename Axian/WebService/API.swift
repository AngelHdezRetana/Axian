//
//  API.swift
//  Axian
//
//  Created by Admin on 6/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

public class API {
    private let domain = "https://shoppapp.liverpool.com.mx"
    private var root = ""
    private var params: [String: Any] = [:]// Parametros que se mandan por medio de httpBody
    private var urlParams: [String: String] = [:] //Parametros que se mandan directamente en la url
    private var headers = ["Content-Type": "application/json"]//Cabeceras del request, se les puede añadir más
    
    //Consulta GET para productos
    func getProducts(result: @escaping ((Result<Data>) -> Void)) {
        root = String(format: "%@/appclienteservices/services/v3/plp?", domain)
        makeApiCall(requestType:"GET", result: result)
    }
    
    //Hace el request a la API seteando automaticamente los valores de las cabeceras y parametros de consulta
    private func makeApiCall(requestType: String, result: @escaping ((Result<Data>) -> Void)) {
        addUrlParamsToRoot()
        var request = URLRequest(url: URL(string: root)!)
        if !params.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        request.httpMethod = requestType
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, _, _ -> Void in
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any] {
                    print(json)
                }
                if let dataFromWebService = data {
                    result(.success(dataFromWebService))
                }
            } catch {
                
            }
        })
        
        task.resume()
    }
    
    //Agrega los parametros que van en la url en caso de tener alguno
    func addUrlParamsToRoot() {
        if !urlParams.isEmpty {
            for (key, value) in urlParams {
                root += String(format: "%@=%@&", key, value)
            }
            
            root = String(root.dropLast()) //Elimina el & del final
        }
    }
    
    //Seters para antes de realizar la consulta
    func setParams(params: [String: Any]) {
        self.params = params
    }
    
    func setUrlParams(urlParams: [String: String]) {
        self.urlParams = urlParams
    }
    
    func setHeaders(headers: [String: String]) {
        for (key, value) in headers {
            self.headers[key] = value
        }
    }
}
