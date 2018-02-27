import Cocoa

class viewMaker{
    
    func make(json : Dictionary<String,Any> , window : NSWindow){
        let SJ : swift_json_parser = swift_json_parser() //new instance of class swift_json_parser
        SJ.parser(json: json) //reading json file and putting it into struct array
        for n in 0..<100 { //for (int n=0; n<100 ; n++)
            if(SJ.getComponentType(n: n) == "button"){
                let dynaminBtn = NSButton.init(title: "dynamic", target: self, action: nil)
                dynaminBtn.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynaminBtn.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                dynaminBtn.title = SJ.getText(n: n)
                if(SJ.getAlign(n: n) == "right"){
                    dynaminBtn.alignment = .right
                }
                else if (SJ.getAlign(n: n) == "left"){
                    dynaminBtn.alignment = .left
                }
                else {
                    dynaminBtn.alignment = .center
                }
                
                if(SJ.getDisablity(n: n)){
                    dynaminBtn.isEnabled = false
                }
                else{
                    dynaminBtn.isEnabled = true
                }
                
                if(SJ.getVisiblity(n: n)){
                    dynaminBtn.isHidden = false
                }
                else {
                    dynaminBtn.isHidden = true
                }
                if (SJ.getTooltip(n: n) != ""){
                    dynaminBtn.toolTip = SJ.getTooltip(n: n)
                }
                window.contentView?.addSubview(dynaminBtn)
            }
            if(SJ.getComponentType(n: n) == "label"){
                let dynamicLbl = NSTextField.init(labelWithString: SJ.getText(n: n))
                dynamicLbl.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynamicLbl.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                if(SJ.getDisablity(n: n)){
                    dynamicLbl.isEnabled = false
                }
                else{
                    dynamicLbl.isEnabled = true
                }
                
                if(SJ.getVisiblity(n: n)){
                    dynamicLbl.isHidden = false
                }
                else {
                    dynamicLbl.isHidden = true
                }
                if (SJ.getTooltip(n: n) != ""){
                    dynamicLbl.toolTip = SJ.getTooltip(n: n)
                }
                window.contentView?.addSubview(dynamicLbl)
            }
            if(SJ.getComponentType(n: n) == "textbox"){
                let dynamicTxt = NSTextField.init()
                dynamicTxt.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynamicTxt.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                if(SJ.getDisablity(n: n)){
                    dynamicTxt.isEnabled = false
                }
                else{
                    dynamicTxt.isEnabled = true
                }
                if(SJ.getAlign(n: n) == "right"){
                    dynamicTxt.alignment = .right
                }
                else if (SJ.getAlign(n: n) == "left"){
                    dynamicTxt.alignment = .left
                }
                else {
                    dynamicTxt.alignment = .center
                }
                
                
                if(SJ.getVisiblity(n: n)){
                    dynamicTxt.isHidden = false
                }
                else {
                    dynamicTxt.isHidden = true
                }
                if (SJ.getTooltip(n: n) != ""){
                    dynamicTxt.toolTip = SJ.getTooltip(n: n)
                }
                window.contentView?.addSubview(dynamicTxt)
            }
            if(SJ.getComponentType(n: n) == "combobox"){
                let dynamicCombo = NSComboBox.init()
                dynamicCombo.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynamicCombo.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                let array = SJ.getChild(n: n)
                for i in array{
                    dynamicCombo.addItem(withObjectValue: i)
                }
                window.contentView?.addSubview(dynamicCombo)
                
            }
            if(SJ.getComponentType(n: n) == "groupbox"){
                let dynamicBox = NSBox.init()
                
                dynamicBox.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynamicBox.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                dynamicBox.title = SJ.getText(n: n)
                dynamicBox.boxType = NSBox.BoxType.primary
                dynamicBox.borderType = NSBorderType.bezelBorder
                
                let array = SJ.getChild(n: n)
                var x = 0
                for i in array{
                    
                    let dynamicRadio = NSButton.init(radioButtonWithTitle: i, target: self, action: nil)
                    dynamicRadio.setFrameOrigin(NSPoint(x: 0, y: x*20))
                    
                    dynamicBox.addSubview(dynamicRadio)
                    x += 1
                }
                window.contentView?.addSubview(dynamicBox)
            }
            if(SJ.getComponentType(n: n) == "radiobutton"){
                let dynamicRadio = NSButton.init()
                dynamicRadio.setButtonType(NSButton.ButtonType.radio)
                dynamicRadio.imagePosition = .imageRight
                dynamicRadio.title = SJ.getText(n: n)
                
                dynamicRadio.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                dynamicRadio.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                
                
                window.contentView?.addSubview(dynamicRadio)
            }
            if(SJ.getComponentType(n: n)=="checkbox"){
                let dynamicCheckbox = NSButton.init()
                dynamicCheckbox.setButtonType(NSButton.ButtonType.switch)
                dynamicCheckbox.title = SJ.getText(n: n)
                dynamicCheckbox.imagePosition = .imageRight
                dynamicCheckbox.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                dynamicCheckbox.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                window.contentView?.addSubview(dynamicCheckbox)
            }
            if(SJ.getComponentType(n: n)=="treeview"){
                //not working yet
                let dynamicTree = NSOutlineView.init()
                dynamicTree.selectionHighlightStyle = .sourceList
                dynamicTree.floatsGroupRows = false
                dynamicTree.indentationPerLevel = 16
                dynamicTree.indentationMarkerFollowsCell = false
                dynamicTree.wantsLayer = true
                
                
                dynamicTree.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                dynamicTree.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                window.contentView?.addSubview(dynamicTree)
            }
            // other components will be place here
        }
    }
    
    
}

