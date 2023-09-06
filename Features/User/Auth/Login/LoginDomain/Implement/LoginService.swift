//
//  LoginService.swift
//  LoginDomainImpl
//
//  Created by 박준하 on 2023/09/06.
//  Copyright © 2023 lookMonster.io. All rights reserved.
//

import Foundation

public protocol LoginService {
    func authenticate(username: String, password: String, completion: @escaping (Bool, Error?) -> Void)
}

public class LoginServiceImpl: LoginService {
    public func authenticate(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        if username == "user" && password == "password" {
            completion(true, nil)
        } else {
            let error = NSError(domain: "LoginErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "로그인에 실패했습니다."])
            completion(false, error)
        }
    }
}
