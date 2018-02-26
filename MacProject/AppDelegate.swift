
import Cocoa

@available(OSX 10.11, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var windowDelegate: NSWindowDelegate!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Insert code here to initialize your application
        window.setContentSize(NSSize(width:800 , height: 600))
        window.delegate = windowDelegate
        window.level = NSWindow.Level.mainMenu
        window.isOpaque = false
        window.title = "json parser"
        let contentView = window.contentView!
        let buttonExit = NSButton.init(title: "Exit", target: self, action: #selector(AppDelegate.myClose(_:)))
        buttonExit.frame.origin = CGPoint(x : 20 ,y : 20)
        buttonExit.frame.size = CGSize(width: 100, height: 35)
        contentView.addSubview(buttonExit)
        
        let buttonJson = NSButton.init(title: "Json", target: self, action: #selector(AppDelegate.myAction(_:)))
        buttonJson.frame.origin = CGPoint(x : 100,y : 100)
        buttonJson.frame.size = CGSize(width: 90, height: 35)
        contentView.addSubview(buttonJson)
        window.center()
        window.makeKeyAndOrderFront(window)
    }
    
    @objc func myAction(_ sender:AnyObject){
        if let path = Bundle.main.path(forResource: "index", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path),options: .alwaysMapped)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let jsonDictionary = json as! Dictionary<String,Any>
                let testView1 : viewMaker = viewMaker()
                testView1.make(json: jsonDictionary, window: window)
                
            } catch let error{
                print("parse error: \(error.localizedDescription)")
            }
        }
        else {
            print("Invalid filename/path for json.")
        }
    }
    
    @objc func myClose(_ sender:AnyObject){
        print("program exited using exit(0)")
        exit(0)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

class windowDelegate: NSObject,NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        exit(0)
    }
}
