//
//  Dynamic.swift
//  AutomatedTesting
//
//  Created by Khairul on 11/3/18.
//  Copyright © 2018 Khairul. All rights reserved.
//

import UIKit

class Dynamic<T> {

    typealias Listener = (T) -> ()
    var listener:Listener?
    
    var value:T{
        didSet
        {
            listener?(value)
        }
    }
    
    init(_ v:T) {
        value = v
    }
    
    func bind(_ listener:@escaping Listener)
    {
        self.listener = listener
    }
    
    func bindAndFire(_ listener:@escaping Listener)
    {
        self.listener = listener
        self.listener?(value)
    }
    
    
}
