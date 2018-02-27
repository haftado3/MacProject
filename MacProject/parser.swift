
import Foundation
class swift_json_parser{
    struct item {
        var width = 0
        var height = 0
        var locationx = 0
        var locationy = 0
        var componentType = ""
        var text = ""
        var textAlign = ""
        var visible = true
        var disabled = false
        var tooltip = ""
    }
    private var current : Int = 0
    private(set) var items = [item](repeating:item(width: 0, height: 0, locationx: 0, locationy: 0, componentType: "", text: "", textAlign: "", visible: true, disabled: false,tooltip: ""), count:100)
    
    public func parser(json : Dictionary<String,Any>){
        for(key , value) in json{
            if let json2: Dictionary<String,Any> = value as? Dictionary<String,Any>
            {
                parser(json: json2)
            }
            else{
                let childkey = key as String
                if (childkey == "ComponentType"){
                    items[current].componentType = value as! String
                }
                if (childkey == "LocationX"){
                    items[current].locationx = value as! Int
                }
                if (childkey == "LocationY"){
                    items[current].locationy = value as! Int
                }
                if (childkey == "Width"){
                    items[current].width = value as! Int
                }
                if (childkey == "Height"){
                    items[current].height = value as! Int
                }
                if (childkey == "Text"){
                    items[current].text = value as! String
                }
                if (childkey == "TextAlignment"){
                    items[current].textAlign = value as! String
                }
                if (childkey == "Visible"){
                    items[current].visible = value as! Bool
                }
                if (childkey == "Disabled"){
                    items[current].disabled = value as! Bool
                }
                if (childkey == "Tooltip"){
                    items[current].tooltip  = value as! String
                }
            }
        }
        current += 1
        if(current == 100){
            return
        }
    }
    func getItems() -> [item] {
        return items
    }
    func getLocationX(n : Int) -> Int {
        return items[n].locationx
    }
    func getLocationY(n : Int) -> Int {
        return items[n].locationy
    }
    func getWidth(n : Int) -> Int {
        return items[n].width
    }
    func getHeight(n : Int) -> Int {
        return items[n].height
    }
    func getComponentType(n : Int) -> String {
        return items[n].componentType
    }
    func getText(n : Int) -> String{
        return items[n].text
    }
    func getAlign(n : Int) -> String{
        return items[n].textAlign
    }
    func getVisiblity(n : Int) -> Bool{
        return items[n].visible
    }
    func getDisablity(n : Int) -> Bool{
        return items[n].disabled
    }
    func getTooltip(n : Int) -> String {
        return items[n].tooltip
    }
}

