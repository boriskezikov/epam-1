//
//  Parent.swift
//  Swiift-project1
//
//  Created by Kezikov Boris  on 23.01.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import Foundation

public class Parent{
    
    private var param1:String
    
    private var param2:Int
    
    init(param1:String, param2:Int){
        self.param1 = param1;
        self.param2 = param2
    }
    
    public func getParam1()->String{
        return self.param1
    }
    
    public func getParam2()->Int{
        return self.param2
    }
    
    public func setParam1(param1:String){
        self.param1 = param1
    }
    
    public func setParam2(param2:Int){
           self.param2 = param2
       }
       
    
    
}
