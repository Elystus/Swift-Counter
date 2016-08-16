//
//  CounterCore.swift
//  countPlusPlus
//
//  Created by Andrew Black on 6/20/16.
//  Copyright © 2016 Andrew Black. All rights reserved.
//

import Foundation

class CounterCore {
    
    private var _name: String
    var name: String {
        get {
            return _name
        }
        
        set {
            _name = newValue
        }
    }
    
    private var _value: Int
    var value: Int {
        get {
            return _value
        }
    }
    
    private var initValue: Int
    
    init(name: String, value: Int) {
        self._name = name
        self._value = value
        self.initValue = value
    }
    
    convenience init(name: String) {
        self.init(name: name, value: 0)
    }
    
    func valueIncrement() {
        _value = _value + 1
    }
    
    func valueDecrement() {
        _value = _value - 1
    }
    
    func valueReset() {
        _value = initValue
    }
}