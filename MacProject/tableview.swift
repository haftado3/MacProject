import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let newWindow = NSWindow(contentRect: NSMakeRect(0, 0, NSScreen.mainScreen()!.frame.width/2, NSScreen.mainScreen()!.frame.height/2), styleMask: NSTitledWindowMask|NSResizableWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask, backing: NSBackingStoreType.Buffered, defer: false)
    let newText = NSTextField(frame: NSMakeRect(0, NSScreen.mainScreen()!.frame.height/4, NSScreen.mainScreen()!.frame.width/2, 40))
    let myView = NSView(frame: NSMakeRect(0, 0, NSScreen.mainScreen()!.frame.width/2, NSScreen.mainScreen()!.frame.height/2))
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        newText.font = NSFont(name: "Arial Black", size: 24)
        newText.backgroundColor = NSColor.clearColor()
        newText.bordered = false
        newText.textColor = NSColor.whiteColor()
        newText.alignment = .CenterTextAlignment
        newText.stringValue = "Hello World"
        newText.selectable = false
        newWindow.opaque = false
        newWindow.movableByWindowBackground = true
        newWindow.backgroundColor = NSColor(calibratedHue: 0, saturation: 1.0, brightness: 0, alpha: 0.7)
        newWindow.title = "Hello World"
        newWindow.center()
        newWindow.contentView.addSubview(myView)
        myView.addSubview(newText)
        newWindow.makeKeyAndOrderFront(nil)
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}
