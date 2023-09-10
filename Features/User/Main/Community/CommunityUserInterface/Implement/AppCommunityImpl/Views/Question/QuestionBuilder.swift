import RIBs
import CommunityUserInterface

final class QuestionComponent: Component<QuestionDependency> {
    
}

public final class QuestionBuilder: Builder<QuestionDependency>, QuestionBuildable {
    
    public override init(dependency: QuestionDependency) {
        super.init(dependency: dependency)
    }
    
    public func build(withListener listener: QuestionListener, cuttentImageIndex: Int?) -> ViewableRouting {
        let component = Component(dependency: dependency)
        let viewController = QuestionViewController()
        let interactor = QuestionInteractor(presenter: viewController)
        interactor.listener = listener
        
        return QuestionRouter(interactor: interactor, viewController: viewController)
    }
}
