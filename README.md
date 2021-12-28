
## Project Details

In this project based on MVVM architecture, mobx and provider packages are used for state management. Incoming data is provided by *** via API. In order for this application to work properly on different devices, attention has been paid to make it responsive and adaptive. The project has been separated two main part as folder system as core and view.


#### Folder Systems

The project has been separated two main part as folder system as core and view.

 


- Core 

Core side of project is using for manage the operation such as navigation, networking etc. Also it includes some app constants, base structure, useful extensions. I can manage all of the codes easily thanks to core and it helps to write cleaner, reusable and testable code. 

 - View

View side of project includes view file and business logics file. Every screen has a main view folder and it has 4 folders such as view, view_model , service and model. 


#### State Management

In this project, mobx and provider packages are used for state management. Every view_model file inherited by mobx features and same times an element of provider.  With the mobx package and the BaseView structure in the core file, a reactive project was created without having to use statefulwidget. Also using the provider package, the view model files are being reachable each other.




#### About Test 

- Network component unit testing
- Testing with mockito packages

