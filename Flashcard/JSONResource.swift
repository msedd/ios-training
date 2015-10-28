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
    typealias CompletionHandler = () -> ()
    private var completionHandler : CompletionHandler?
    
    init(bundleFilename: String) {
        self.url = NSBundle.mainBundle().URLForResource( bundleFilename , withExtension: "json")!
    }
    
    init(url: NSURL) {
        self.url = url
    }
    
    func load(completionHandler : CompletionHandler) {
        self.completionHandler = completionHandler
        load();
    }
    func load() {
        
        if url.scheme.lowercaseString == "file" {
            self.handleData(NSData(contentsOfURL: url)!)
        } else {
            let task = NSURLSession.sharedSession().dataTaskWithURL(self.url) {
            (data, response, error) in
            if let data=data{
                self.handleData(data)
            }else {
                NSLog("%@", "Fehler beim Laden von \(self.url): \(error)")
            }
        }
        task.resume()
        
        }
    }
    
    func handleData(data : NSData) {
        let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        handleJSON(jsonObject)
        self.completionHandler?()
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