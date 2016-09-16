# coordinators
This project exemplifies the use of coordinators.

The sample application contains a sign up flow letting the user enter a email and a password. Check out the project at commit "Add sign up with standard view controller routing" to see the project before coordinators was added.

Coordinators make it easier to reuse view controllers because the navigation logic is moved outside of the view controllers to coordinators. This also makes it easier to control status bar updates. Another benefit is that data does not need to be passed between view controller in navigation flows. It is also easier to avoid over use of singletons. 

The Coordinator pattern is well described in an [article] (http://khanlou.com/2015/10/coordinators-redux/) by Soroush Khanlou and in [this](http://merowing.info/2016/01/ blog postimprove-your-ios-architecture-with-flowcontrollers/) blog post by Krzysztof Zabłocki. Soroush has presented coordinators in a [talk](https://vimeo.com/144116310). Krzysztof also touches on the subject in [this](http://slideslive.com/38897361/good-ios-application-architecture-en) presentation.