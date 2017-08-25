#Hatchback Read Me
This readme will explain some of the workings of Hatchback, it’s file structure and some of the nuances or things to know about little weird things about the Swift Language.

##Before you start, some things to look at: 
- Credentials are in the Hatchback Credentials.md file
- [Optionals](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID330)
- [Cocoapods](https://cocoapods.org/) iOS Dependency Manager 
- [Interface Builder](https://code.tutsplus.com/tutorials/beginning-ios-development-using-interface-builder--mobile-3785) Just the basics.
- [Parse](http://parseplatform.org/)
- [Parse iOS Documentation](http://docs.parseplatform.org/ios/guide/)

##Where is the project?
Currently these are the tasks that need completed in the app, things that I didn’t get to because I had to design with Alicia’s illustrations and setbacks that we had earlier with Jimmy put us way behind schedule.

Designs are in the Photoshop file: MainScreens 2 in the Hatchback folder on Google Drive.

- Login with Onboarding
- Setting points on the graphs based on the data in Parse.
- Setting where the settings buttons go to and show. 
- Implementing sponsorship through Stripe on the web and integrating in the app. The views for the graphs and others do need to be made.


##File Structure 
In iOS the most common file structure MVC (Model-View-Controller or other known as Model-View-ViewController). You always try to adapt to this pattern because it makes everything more easy to work with. But there are sometimes memory or reference issues where sometimes you just need to directly do things on the view controller. 

How it is setup currently is everything started on the ViewController and then was design to be modular and adapt the MVC pattern. There are a couple parts where the work is really light, so it doesn’t make sense to make the view controllers modular, and other areas where I didn’t have time to make it modular. 

Almost all of the UI work has been done in the Storyboard. The dashboard constraints because of their odd shape that constraints cannot easily accommodate device sizes, have been done in the Dashboard Constraints where I set up an easy way to add constraints for specific devices so everything comes out in an easy nice way once it’s all said and done.

DriveDefaults works with all the UserDefaults including leaving the app unauthorized and authorized. It also helps any other UserDefaults included in the app. It was created because it’s easier to work with than directly accessing user defaults and catches some nil errors in a way that let’s you handle them much more easily. I would recommend using this, because it keeps your code more concise, compact, and easier to read. 

For every pfquerytableview, you NEED a custom pftableviewcell to go with it, you can’t use individual cells or else you get reference errors dealing with IBOutlets linking to the same thing. 

In order to test on an actual device you will NEED a iOS Developer Account and License and change the settings in all of the workspace targets, i.e. Cocoapods, hatchback, and graph2dframework targets to the new developer account.

I’m sure there are a lot of weird things that don’t make sense or look like it was done really quick so if you have questions please feel free to email me at alexszandc@gmail.com or if I’m still in Slack, @asantarelli. 