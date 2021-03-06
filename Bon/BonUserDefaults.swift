//
//  BonUserDefaults.swift
//  Bon
//
//  Created by Chris on 16/4/19.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

let loginStateKey = "loginState"

let usernameKey = "username"
let passwordKey = "password"
let balanceKey = "balance"
let usedDataKey = "usedData"
let IPKey = "IP"
let secondsKey = "seconds"

//Get balance success with string: {
//    "buy_mbytes" = "0.00";
//    "buy_minutes" = "<null>";
//    charge = "10.00";
//    client = WEB;
//    fid = 1304;
//    "flux_long" = "9.50G";
//    "flux_long1" = B;
//    "flux_long6" = B;
//    "free_in_bytes" = 1B;
//    "free_out_bytes" = 0B;
//    ipv = 4;
//    limit = 0;
//    "month_fee" = "10.00";
//    "remain_fee" = "1.53";
//    "remain_flux" = "2,030.82M";
//    "remain_timelong" = "<null>";
//    speed = 0;
//    "time_long" = 0;
//    "time_long1" = 0;
//    "time_long6" = 0;
//    uid = 44064;
//    "user_balance" = "11.53";
//    "user_in_bytes" = "22.98KB";
//    "user_ip" = "10.194.182.53";
//    "user_login_name" = 1120141755;
//    "user_login_time" = "2016-04-19 18:27:22";
//    "user_out_bytes" = "25.10KB";
//}

class BonUserDefaults {
    
    static let defaults = UserDefaults.standard
    
    static var isLogined: Bool {
        if loginState == LoginState.ONLINE.description {
            return true
        } else {
            return false
        }
    }
    
    class func saveUserDefaults(_ username: String, password: String, uid: String) {
        
        defaults.setValue(username, forKey: usernameKey)
        defaults.setValue(password, forKey: passwordKey)
        defaults.synchronize()
        
        defaults.synchronize()
    }
    
    class func cleanAllUserDefaults() {
        
        defaults.removeObject(forKey: usernameKey)
        defaults.removeObject(forKey: passwordKey)
        
        defaults.synchronize()
    }
    
    static var username: String = {
        let savedUsername = defaults.string(forKey: usernameKey)
        if let username = savedUsername {
            return username
        } else {
            return ""
        }
        }() {
        didSet {
            defaults.setValue(username, forKey: usernameKey)
            defaults.synchronize()
        }
    }
    
    static var password: String = {
        let savedPassword = defaults.string(forKey: passwordKey)
        if let password = savedPassword {
            return password
        } else {
            return ""
        }
        }() {
        didSet {
            defaults.setValue(password, forKey: passwordKey)
            defaults.synchronize()
        }
    }
    
    static var loginState: String = {
        let savedLoginState = defaults.string(forKey: loginStateKey)
        if let loginState = savedLoginState {
            return loginState
        } else {
            return LoginState.ONLINE.description
        }
        }() {
        didSet {
            defaults.setValue(loginState, forKey: loginStateKey)
            defaults.synchronize()
        }
    }
    
    static var balance: Double = {
        let balance = defaults.double(forKey: balanceKey)
        return balance
        }() {
        didSet {
            defaults.setValue(balance, forKey: balanceKey)
            defaults.synchronize()
        }
    }
        
    static var IP: String = {
        let savedUserIP = defaults.string(forKey: IPKey)
        if let userIP = savedUserIP {
            return userIP
        }
        return ""
        }() {
        didSet {
            defaults.setValue(IP, forKey: IPKey)
            defaults.synchronize()
        }
    }
    
    static var seconds: Int = {
        let seconds = defaults.integer(forKey: secondsKey)
        return seconds
        }() {
        didSet {
            defaults.set(seconds, forKey: secondsKey)
            defaults.synchronize()
        }
    }
    
    static var usedData: Double = {
        let usedData = defaults.double(forKey: usedDataKey)
        return usedData
        }() {
        didSet {
            defaults.set(usedData, forKey: usedDataKey)
            defaults.synchronize()
        }
    }

}
