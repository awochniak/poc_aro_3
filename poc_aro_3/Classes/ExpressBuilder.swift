import core

public class ExpressBuilder: EntrypointBuilder<ExpressResult> {

    var url: String? = nil
    
    public func url(_ url: String) -> ExpressBuilder { self.url = url; return self}

    public override func build() -> EntrypointStarter {
        url.throwIfNull("url")
        return EntrypointStarter(Express(builder: self))
    }

}
