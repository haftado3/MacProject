import Cocoa

class viewMaker{
    
    func make(json : Dictionary<String,Any> , window : NSWindow){
        let SJ : swift_json_parser = swift_json_parser() //new instance of class swift_json_parser
        SJ.parser(json: json) //reading json file and putting it into struct array
        for n in 0..<100 { //for (int n=0; n<100 ; n++)
            if(SJ.getComponentType(n: n) == "button"){
                let buttondynamic = NSButton.init(title: "dynamic", target: self, action: nil)
                buttondynamic.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                buttondynamic.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                buttondynamic.title = SJ.getText(n: n)
                if(SJ.getAlign(n: n) == "right"){
                    buttondynamic.alignment = .right
                }
                else if (SJ.getAlign(n: n) == "left"){
                    buttondynamic.alignment = .left
                }
                else {
                    buttondynamic.alignment = .center
                }
                
                if(SJ.getDisablity(n: n)){
                    buttondynamic.isEnabled = false
                }
                else{
                    buttondynamic.isEnabled = true
                }
                
                if(SJ.getVisiblity(n: n)){
                    buttondynamic.isHidden = false
                }
                else {
                    buttondynamic.isHidden = true
                }
                if (SJ.getTooltip(n: n) != ""){
                    buttondynamic.toolTip = SJ.getTooltip(n: n)
                }
                window.contentView?.addSubview(buttondynamic)
            }
            // other components will be place here
        }
    }
    
    
}

