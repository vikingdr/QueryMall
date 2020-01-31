//
//  Server.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/7/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//
//  Server class takes care of communications between the client(app) and server
//  It has "post" and "get" methods

import Foundation
import Alamofire


class Server: NSObject {

    
    
    //MARK: - Post
    
    /**
     
     Post data as JSON object to the given URL with a completion handler
     
     - Parameters:
        - params: dictionary of data
        - url: destination URL
     */
    class func post(params : Dictionary<String, String>, url : String, postCompleted: (succeeded: Bool, msg: String) -> ()) {
        
        //Create a request and a session to operate on
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        
        //Add HTTP method and headers stating content type is JSON type
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        //Encode parameters as NSData, and set the HTTPBody of the request to this NSData object
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])

        } catch {
            // Catch fires here, with an NSErrro being thrown from the dataWithJSONObject method
            print("A JSON wrapping error occurred, here are the details:\n \(error)")
        }
        
        
        print (request.description)
        
        //Instantiate a NSTask from the NSURLSession object with dataTaskWithRequest()
        let task  = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body: \(strData)")
            
            do{
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let json : NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary{
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    let success: Bool = (json["success"] as? Bool)!
                    print("Succes: \(success)")
                    postCompleted(succeeded: success, msg: "Logged in")
                    
                }else{
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: \(jsonStr)")
                    postCompleted(succeeded: false, msg: "Error")
                    
                }
            }catch {
                // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
                print(error)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                
                //Post method
                postCompleted(succeeded: false, msg: "Error")

            }
    
        })
        
        task.resume()
    }
    
    
    
    /**
     
     Post data as JSON object to the given URL 
     
     - Parameters:
        - params: dictionary of data
        - url: destination URL
     */
    class func post_2(params : Dictionary<String, String>, url : String) {
        
        //Create a request and a session to operate on
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        
        //Add HTTP method and headers stating content type is JSON type
        
        //Encode parameters as NSData, and set the HTTPBody of the request to this NSData object
        //Convert data to json object
        let jsondata:NSData?
        do {
            jsondata = try NSJSONSerialization.dataWithJSONObject(params, options: [])
            request.HTTPBody = jsondata
            request.HTTPMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        } catch {
            // Catch fires here, with an NSErrro being thrown from the dataWithJSONObject method
            print("A JSON wrapping error occurred, here are the details:\n \(error)")
        }
        
        //Instantiate a NSTask from the NSURLSession object with dataTaskWithRequest()
        let task  = session.dataTaskWithRequest(request) {data, response, error in
            print("Response is : \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Body is: \(strData)")
            
            do{
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let json : NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary{
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    let success: Bool = (json["success"] as? Bool)!
                    print("Succes: \(success)")
                    
                }else{
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: \(jsonStr)")
                    
                }
            }catch {
                // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
                print(error)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                
                //Post metho
            }
            
            
        }
        
        task.resume()
        
        
    }

    
    
    
    //MARK: - Get
    /**
    Requesting data from the server
    
    */
    class func get(url: String, completionHandler: (data : [Deal]) -> Void) {
        //Create a request and a session to operate on
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let returnResult = NSMutableArray()
        var returnArray : [Deal] = []
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in

            //Will happen when the task complete
            if error != nil {
                print(error)
            } else {
                //Decode data to readable string
                let result = NSString(data: data!, encoding:
                    NSASCIIStringEncoding)!
                print("Body of GET is: \(result)")
                print(data?.description)
                print(data)
                
                do{
                    let json: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
//                    returnResult = json.mutableCopy() as! NSMutableDictionary
                    print(json.description)
                
                    let deals = NSMutableArray()
                    
                    for infoValues in json {
                        print (infoValues)
                        print(infoValues.key)
                        print(infoValues.value.description)
                        let deal = Deal(name: infoValues.key as! String, withDealInfo: infoValues.value as! NSDictionary)
                        
                        returnResult.addObject(deal)
                        returnArray.append(deal)
                    }
                    
                    print (deals)
                    completionHandler(data: returnArray)
                    
                }catch{
                    // Catch fires here, with an NSErrro being thrown from the dataWithJSONObject method
                    print("A JSON wrapping error occurred, here are the details:\n \(error)")

                }
                


//                Constants.DummyMyDealss = data

            }
        }
        
        task.resume()
        

    }

    
    
    
    /**
    {
        "eventData": {
            "eventDate": "Jun 13, 2012 12:00:00 AM",
            "eventLocation": {
                "latitude": 43.93838383,
                "longitude": -3.46
            },
            "text": "hjhj",
            "imageData": "raw data",
            "imageFormat": "JPEG",
            "expirationTime": 1339538400000
        },
        "type": "ELDIARIOMONTANES",
        "title": "accIDENTE"
    }
    
    NSDictionary *eventLocation = [NSDictionary dictionaryWithObjectsAndKeys:@"43.93838383",@"latitude",@"-3.46",@"latitude" nil];
    
    NSMutableDictionary *eventData = [NSDictionary dictionaryWithObjectsAndKeys:eventLocation,@"eventLocation", nil];
    [eventData setObject:@"Jun 13, 2012 12:00:00 AM" forKey:@"eventDate"];
    [eventData setObject:@"hjhj" forKey:@"text"];
    .
    .
    .
    NSMutableDictionary *finalDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:eventData,@"eventData", nil];
    [finalDictionary setObject:@"ELDIARIOMONTANES" forKey:@"type"];
    [finalDictionary setObject:@"accIDENTE" forKey:@"title"];

    */

}