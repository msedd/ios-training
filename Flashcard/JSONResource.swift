    //
//  JSONResource.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation


class JSONResource {
    
    let url : NSURL
    
    init(bundleFilename: String) {
        self.url = NSBundle.mainBundle().URLForResource( bundleFilename , withExtension: "json")!
    }
    
    func load() {
        let data = NSData(contentsOfURL: url)!
        handleData(data)
    }
    
    func handleData(data : NSData) {
        let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        handleJSON(jsonObject)
    }
    /**
    Overwrite handleJSON in sub-classes to handle the JSON data
    when loaded successfully
    */
    func handleJSON(jsonObject : AnyObject) {
        NSLog("%@", "handleJSON not implemented in \(self)")
        abort()
    }
}