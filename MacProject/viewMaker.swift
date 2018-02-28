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
            if(SJ.getComponentType(n: n)=="grid"){
                //a scroll view which holds tree
                let scrlView = NSScrollView.init()
                scrlView.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                scrlView.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                scrlView.borderType = .bezelBorder
                scrlView.hasVerticalScroller = true
                scrlView.hasHorizontalScroller = true
                scrlView.autohidesScrollers = false
                
                //a tree view
                let treeView  = NSOutlineView.init()
                treeView.translatesAutoresizingMaskIntoConstraints = false
                treeView.enclosingScrollView?.contentView.scroll(to: NSMakePoint(0, 0))
                treeView.enclosingScrollView?.verticalScroller?.floatValue = 0.0
                treeView.selectionHighlightStyle = .sourceList
                treeView.allowsColumnReordering = true
                treeView.allowsColumnReordering = true
                
                //a table column
                let column = NSTableColumn.init()
                column.title = "column 0"
                
                
                //adding column to table
                treeView.addTableColumn(column)
                
                //adding tree to scroll view
                scrlView.documentView = treeView
                
                //adding scroll view to window
                window.contentView?.addSubview(scrlView)
            }
            if(SJ.getComponentType(n: n) == "loading")
            {
                let loading = NSProgressIndicator.init()
                loading.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                loading.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                loading.style = .spinning
                loading.usesThreadedAnimation = true
                loading.isIndeterminate = true
                loading.isHidden = false
                loading.startAnimation(nil)
                window.contentView?.addSubview(loading)
            }
            if(SJ.getComponentType(n: n) == "search")
            {
                let search = NSSearchField.init()
                search.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                search.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                window.contentView?.addSubview(search)
            }
            if(SJ.getComponentType(n: n) == "richedit"){
                let scrlView = NSScrollView.init()
                //i may need to change this totally for adding horizontally resizable
                scrlView.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                scrlView.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                scrlView.hasVerticalScroller = true
                scrlView.autohidesScrollers = false
                scrlView.borderType = .bezelBorder
                
                let rich = NSTextView.init()
                rich.isRichText = true
                rich.maxSize = NSMakeSize(CGFloat(Float.greatestFiniteMagnitude), CGFloat(Float.greatestFiniteMagnitude))
                rich.isHorizontallyResizable = true
                
                scrlView.documentView = rich
                window.contentView?.addSubview(scrlView)
                
                // for NSTextEdit use this guys
                //rich.cell?.wraps = true
                //rich.cell?.isScrollable = true
                //rich.usesSingleLineMode = false
                //rich.lineBreakMode = .byWordWrapping
            }
            // other components will be place here
        }
    }
    
    
}

