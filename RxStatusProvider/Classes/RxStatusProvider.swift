import RxSwift
import RxCocoa
import StatusProvider

public class RxStatus: StatusModel {
    public let isLoading: Bool
    public let title: String?
    public let description: String?
    public let actionTitle: String?
    public let image: UIImage?
    public var action: (() -> Void)? {
        if isLoading || actionTitle == nil {
            return nil
        } else {
            return actionMirror
        }
    }
    
    public var actionMirror: (() -> Void)? = { }
    
    public init(isLoading: Bool = false,
                title: String? = nil,
                description: String? = nil,
                actionTitle: String? = nil,
                image: UIImage? = nil) {
        self.isLoading = isLoading
        self.title = title
        self.description = description
        self.actionTitle = actionTitle
        self.image = image
    }
}

extension RxStatus: ReactiveCompatible { }

public extension Reactive where Base: RxStatus {
    
    public var action: Driver<Void> {
        let observable = Observable<Void>.create({ [weak base] (observer) -> Disposable in
            guard let aBase = base else {
                observer.onCompleted()
                return Disposables.create()
            }
            aBase.actionMirror = {
                observer.onNext(())
            }
            return Disposables.create {
                observer.onCompleted()
            }
        })
        return observable.asDriver(onErrorJustReturn: ())
    }
}

public extension Reactive where Base: StatusController, Base: UIViewController {
    public var status: Binder<RxStatus?> {
        return Binder<RxStatus?>(base) { (base, status) in
            if let status = status {
                base.show(status: status)
            } else {
                base.hideStatus()
            }
        }
    }
}
