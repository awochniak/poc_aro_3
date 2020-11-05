import core
import UIKit

public struct Express: SdkEntrypoint {
    
    let builder : ExpressBuilder
    
    public static func builder() -> ExpressBuilder{
        return ExpressBuilder()
    }
    
    public func start(from parent: UIViewController){
        P24Browser.builder()
            .url(builder.url!)
            .method(BrowserMethod.GET)
            .browserResultHandler { (browserResult) in self.handleBrowserResult(result:browserResult)}
            .build()
            .showAsModal(parentVC: parent)
    }
    
    private func handleBrowserResult(result: BrowserResult){
        switch result {
            case .SUCCESS:
                builder.resultHandler.onResult(ExpressResult.SUCCESS)
            case .ERROR(let errorCode):
                builder.resultHandler.onResult(ExpressResult.ERROR(errorCode ?? ""))
            case .CANCEL:
                builder.resultHandler.onResult(ExpressResult.CANCEL)
        }
    }
}
