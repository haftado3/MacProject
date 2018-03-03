
import Cocoa

@available(OSX 10.11, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var windowDelegate: NSWindowDelegate!
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Insert code here to initialize your application
        window.setContentSize(NSSize(width:800 , height: 600))
        window.delegate = windowDelegate
        window.level = NSWindow.Level.mainMenu
        window.isOpaque = false
        window.title = "json parser"
        //---------
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
        //---------
        window.center()
        window.makeKeyAndOrderFront(window)
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
