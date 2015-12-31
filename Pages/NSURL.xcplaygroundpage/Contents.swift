import Foundation

let url = NSURL(string: "https://api.whitehouse.gov/v1/petitions.json?limit=30")
let data: NSData! = try? NSData(contentsOfURL: url!, options: [])

//print(data)

if let dataValue = data {
    var dataString = NSString(data: dataValue, encoding:NSUTF8StringEncoding)
    print(dataString)
}






