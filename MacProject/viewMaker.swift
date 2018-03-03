import Cocoa

class viewMaker : NSObject{
    var nameArray : [String] = ["ali","hasan"]
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MyView"), owner: self) as? NSTextField
        if result == nil {
            result = NSTextField()
            result?.identifier = NSUserInterfaceItemIdentifier(rawValue: "MyView")
        }
        result?.stringValue = nameArray[row]
        return result
    }
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
                let dynamicBox = NSBox()
                
                dynamicBox.frame.origin = CGPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n))
                dynamicBox.frame.size = CGSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n))
                dynamicBox.title = SJ.getText(n: n)
                dynamicBox.borderType = NSBorderType.bezelBorder
                
                
                let array = SJ.getChild(n: n)
                var x = 0
                let btnCell = NSButtonCell() //this is making a prototype for nsmatrix
                btnCell.title = SJ.getName(n: n)
                btnCell.setButtonType(NSButton.ButtonType.radio)
                btnCell.imagePosition = .imageRight
                btnCell.alignment = .right
                
//                var posx = 0
//                if(dynamicBox.frame.width > 100){
//                    posx = Int(dynamicBox.frame.width - (100 as CGFloat))
//                }
//                else {
//                    posx = 0
//                }
                let matrixRect : NSRect = NSMakeRect(0,0,dynamicBox.frame.width ,dynamicBox.frame.height - 25)
                let mymatrix = NSMatrix(frame: matrixRect, mode: .radioModeMatrix, prototype: (btnCell as NSCell) , numberOfRows: array.endIndex, numberOfColumns: 1)
                dynamicBox.addSubview(mymatrix)
                let cellArray = mymatrix.cells
                if(dynamicBox.frame.width>100){
                    mymatrix.cellSize.width = dynamicBox.frame.width - 15
                }
                
                for i in array{
                    cellArray[x].title = i
                    x += 1
                }
                
                window.contentView?.addSubview(dynamicBox)
            }
            if(SJ.getComponentType(n: n) == "radiobutton"){

                let btnCell = NSButtonCell()
                btnCell.setButtonType(NSButton.ButtonType.radio)
                btnCell.title = "watermelons"
                btnCell.imagePosition = .imageRight
                btnCell.alignment = .right
                
                
                let matrixRect : NSRect = NSMakeRect(CGFloat(SJ.getLocationX(n: n)), CGFloat(SJ.getLocationY(n: n)), CGFloat(SJ.getWidth(n: n)), CGFloat(SJ.getHeight(n: n)))
                
                let mymatrix = NSMatrix(frame: matrixRect, mode: .radioModeMatrix, prototype: (btnCell as NSCell) , numberOfRows: 3, numberOfColumns: 1)
                mymatrix.sizeToFit()
                window.contentView?.addSubview(mymatrix)
                //mymatrix.cellSize = NSSize(width: 200, height: 20)
                let cellArray = mymatrix.cells
                cellArray[0].title = "this is not working "
                cellArray[1].title = "2"
                cellArray[2].title = "3"
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
//                let datasource : [String] = ["one","two","three"]
//                treeView.dataSource = datasource as? NSOutlineViewDataSource
//                treeView.reloadData()
                treeView.gridStyleMask = .solidHorizontalGridLineMask
                
                
                //a table column
                let column = NSTableColumn.init()
                column.title = "ID"
                //column.bind(NSBindingName(rawValue: "hidden"), to: UserDefaults.standard, withKeyPath: "table column status", options: nil)
               
                
                let column2 = NSTableColumn()
                column2.title = "col 2"
                column2.width = 100
                column.isEditable = true
                column2.isEditable = true
                
                //adding column to table
                treeView.addTableColumn(column)
                treeView.addTableColumn(column2)
                
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
                rich.string = "rich text ..."
                scrlView.documentView = rich
                window.contentView?.addSubview(scrlView)
                
                // for NSTextEdit use this guys
                //rich.cell?.wraps = true
                //rich.cell?.isScrollable = true
                //rich.usesSingleLineMode = false
                //rich.lineBreakMode = .byWordWrapping
            }
            if(SJ.getComponentType(n: n) == "syslink"){
                let link = NSTextField()
                link.isBezeled = false
                link.drawsBackground = false
                link.isEditable = false
                link.isSelectable = true
                link.allowsEditingTextAttributes = true
                let url = URL(string: SJ.getText(n: n))
                let linkTextAttributes: [NSAttributedStringKey: Any] = [
                    NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
                    NSAttributedStringKey.foregroundColor: NSColor.blue,
                    NSAttributedStringKey.link: url as Any
                ]
                let string = SJ.getName(n: n)
                link.attributedStringValue = NSAttributedString(string: string, attributes: linkTextAttributes)
                link.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                link.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                window.contentView?.addSubview(link)
                
            }
            if(SJ.getComponentType(n: n) == "line"){
                let line = NSBox()
                line.boxType = .separator
                line.setFrameOrigin(NSPoint(x: SJ.getLocationX(n: n), y: SJ.getLocationY(n: n)))
                line.setFrameSize(NSSize(width: SJ.getWidth(n: n), height: SJ.getHeight(n: n)))
                window.contentView?.addSubview(line)
            }
            if(SJ.getComponentType(n: n) == "statusbar"){
                //this is gonna take a while to work on
//                let btn = NSButton(title: "test", target: self, action: nil)
//                window.contentView?.addSubview(btn)
//                let controller = NSViewController()
//
//                controller.view = NSView(frame: CGRect(x: CGFloat(100), y: CGFloat(50), width: CGFloat(200), height: CGFloat(150)))
//                let popover = NSPopover()
//                popover.contentViewController = controller
//                popover.contentSize = controller.view.frame.size
//                popover.behavior = .transient
//                popover.animates = true
//                let txt = NSTextField(frame: controller.view.frame)
//                txt.stringValue = "testing popover"
//                //txt.textColor = NSColor.blue.withAlphaComponent(0.45)
//                controller.view.addSubview(txt)
//                //txt.sizeToFit()
//                
//                popover.show(relativeTo: btn.bounds, of: btn as NSView, preferredEdge: NSRectEdge.maxY)
            }
            if(SJ.getComponentType(n: n) == "listbox"){
                // need to solve this issue
                let view = NSScrollView(frame: NSMakeRect(200, 200, 100, 100))
                let list = NSOutlineView()
                let listcol1 = NSTableColumn()
                
                list.allowsTypeSelect = true
                listcol1.isEditable = true
                list.addTableColumn(listcol1)
                listcol1.width = 100
                listcol1.title = "list view"
                list.editColumn(0, row: 0, with: nil, select: true)
                
                
                list.reloadData()
                
                view.documentView = list
                window.contentView?.addSubview(view)
            }
            if(SJ.getComponentType(n: n) == "trackbar")
            {
                let slider = NSSlider(frame: NSMakeRect(CGFloat(SJ.getLocationX(n: n)), CGFloat(SJ.getLocationY(n: n)), CGFloat(SJ.getWidth(n: n)), CGFloat(SJ.getHeight(n: n))))
                
                window.contentView?.addSubview(slider)
            }
            if(SJ.getComponentType(n: n) == "timepicker"){
                let timepicker = NSDatePicker(frame: NSMakeRect(CGFloat(SJ.getLocationX(n: n)), CGFloat(SJ.getLocationY(n: n)), CGFloat(SJ.getWidth(n: n)), CGFloat(SJ.getHeight(n: n))))
                window.contentView?.addSubview(timepicker)
            }
            if(SJ.getComponentType(n: n) == "progressbar"){
                let progressbar = NSLevelIndicator(frame: NSMakeRect(CGFloat(SJ.getLocationX(n: n)), CGFloat(SJ.getLocationY(n: n)), CGFloat(SJ.getWidth(n: n)), CGFloat(SJ.getHeight(n: n))))
                progressbar.doubleValue = 2
                progressbar.maxValue = 10
                window.contentView?.addSubview(progressbar)
            }
            
            // other components will be place here
        }
    }
    
    
}



