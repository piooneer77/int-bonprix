Hi Team

	Thank you for inviting me to participate in this task.
Please note that I have some takes on the project I created on the link below.
https://github.com/piooneer77/int-bonprix

What I have done ?
I approached the project given the info provided in this link https://github.com/aacml/Recruiting/wiki/iOS-Code-Challenge-bonprix-Swift-UI from an MVVM approach to laverage the SwiftUI and Combine capability and using Dependancy injection to make it easier for unit testing.

-initially I created the simple network layer using combine and injected the endpoint vars I knew so it can be extended easily
-then I created a Router pattern for navigation to decouble the View layer from the navigation dependancies as much as possible
-After that I created the services along with it's protocols for future Mock Conformance
-Finally I created the Views and ViewModels along with it's subviews trying to breakdown the complexity of the View as much as possible and binding it to the ViewModel taking advantage of Combine.

What I didn't have time to do, However I normally would do
-Using a Dependancy injection Container like Swinject to use it in the Router Layer to inject the Dependancies.
- Adding Unit test for the viewmodels taking advantage of the abstraction from the services protocol by creating a Mock Servie conforming to the protocols and injecting them into the view models
- Testing network calls throught Expectation 



Best Regards
Karem Gohar (Halawany)


