/*:
 # 주소로부터 GPS 위도,경도 알아내기
 playground 환경에서는 정상 동작하지 않는다.
*/

import Foundation
import CoreLocation

let geocoder = CLGeocoder()

func printGPS(text:String) {
    let addressString = text // get the address from somewhere

    // Cancel any existing geocode
    geocoder.cancelGeocode()

    geocoder.geocodeAddressString(addressString) { (placemarks, error) -> Void in
        if error != nil {
            NSLog("error")
        } else {
            let placemark = placemarks!.last!

            let latitude = placemark.location!.coordinate.latitude
            let longitude = placemark.location!.coordinate.longitude

            let latitudeString = String(format: "Latitude: %.4f", latitude)
            let longitudeString = String(format: "Longitude: %.4f", longitude)
                NSLog("\(latitudeString), \(longitudeString)")
        }
    }
}

printGPS("경기도 성남시 분당구 야탑로 124")
printGPS("1 Infinite Loop, Cupertino, California")