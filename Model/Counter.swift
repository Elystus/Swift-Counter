//
//  Counter.swift
//  countPlusPlus
//
//  Created by Andrew Black on 6/18/16.
//  Copyright © 2016 Andrew Black. All rights reserved.
//

import Foundation

class Counter: CounterCore {
    private var counterChildren: [CounterCore]
    private var _valueFamily: Int
    var valueFamily: Int {
        get {
            return _valueFamily
        }
    }
    
    override init(name: String, value: Int) {
        counterChildren = [CounterCore]()
        _valueFamily = value
        
        super.init(name: name, value: value)
    }
    
    func childAdd(name: String, value: Int) {
        let child = CounterCore(name: name, value: value)
        counterChildren.append(child)
    }
    
    func childAdd(name: String) {
        self.childAdd(name, value: 0)
    }
    
    func childFetch(index: Int) -> CounterCore? {
        if index < counterChildren.count {
            return counterChildren[index]
        } else {
            return nil
        }
    }
    
    func childRemove(index: Int) -> Bool {
        if index < counterChildren.count {
            counterChildren.removeAtIndex(index)
            return true
        } else {
            return false
        }
    }
    
    func childArraySize() -> Int {
        return counterChildren.count
    }
    
    private func valueCalculate() {
        var val = value
        for child in counterChildren {
            val += child.value
        }
            
        _valueFamily = val
    }
}