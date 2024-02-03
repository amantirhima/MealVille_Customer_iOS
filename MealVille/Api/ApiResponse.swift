//
//  ApiResponse.swift
//  DeepDental
//
//  Created by Devoir Macbook on 21/12/19.
//  Copyright © 2019 Devoir Macbook. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

@available(iOS 13.0, *)
class GetApiResponse: UIViewController {
    
    static let shared = GetApiResponse()
    
    struct FileDataStruct {
        var paramName:String?
        var url:URL?
        var data:Data?
        var pathExtension:String?
        var lastPathComponent:String?
    }
    
    
    //MARK:- GenericsFunction
    
    @available(iOS 13.0, *)
    func getDataAll<T: Decodable>(api:String,parameters:[String:Any],method:HTTPMethod = .post,completion: @escaping(T)->())  {
        
        
        ApiService.shared.apiRequest(api: api, method: method, parameters: parameters) { (data) in
            guard let data = data else { return }
            do{
                let res = try JSONDecoder().decode(T.self, from: data)
                completion(res)
            }catch{
                print("Error on parsing")
            }
        }
    }
    
    @available(iOS 13.0, *)
    func getDataAllSilent<T: Decodable>(api:String,parameters:[String:Any],completion: @escaping(T)->())  {
        ApiService.shared.apiRequest(api: api, method: .post, parameters: parameters) { (data) in
            guard let data = data else { return }
            do{
                let res = try JSONDecoder().decode(T.self, from: data)
                print(res)
                completion(res)
            }catch{
                print("Error on parsing")
            }
        }
    }
    
    //MultipartApi
    func callApiMultiPartData<T: Decodable>(api:String,fileValue:[String:URL?],parameters:[String:Any],completion: @escaping(T?)->())  {
        ApiService.shared.apiRequestMulipart(api: api, fileValue: fileValue, parameters: parameters) { (data) in
            guard let data = data else { return }
            do{
                let res = try JSONDecoder().decode(T.self, from: data)
                completion(res)
            }catch{
                completion(nil)
                print("Error on parsing")
            }
        }
    }
    //MARK:-LOGIN API's
    
    func addCompany<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAll(api: AppConstants.addCompany,parameters: params, method: .post) { (data: T) in
            completion(data)
        }
    }
    
    func deleteCompnay<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAll(api: AppConstants.deleteCompnay,parameters: params, method: .post) { (data: T) in
            completion(data)
        }
    }
    
    //MARK:- Dashboard Api's
    func getCompany<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAllSilent(api: AppConstants.getCompany,parameters: params) { (data: T) in
            completion(data)
        }
    }
    
    func sendOtp<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAllSilent(api: AppConstants.sendOtp,parameters: params) { (data: T) in
            completion(data)
        }
    }
    func verify<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAllSilent(api: AppConstants.verifyOtp,parameters: params) { (data: T) in
            completion(data)
        }
    }
    
    func signUp<T: Decodable>(params:[String:Any],completion: @escaping(T)->()) {
        GetApiResponse.shared.getDataAllSilent(api: AppConstants.signUp,parameters: params) { (data: T) in
            completion(data)
        }
    }
    
    
    
}


