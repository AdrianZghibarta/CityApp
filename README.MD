### City Info App

The identified needs:

Simple iOS application with two screens
1. Cities List Screen
2. City Details Screen

Supported device orientation
1. Portrait
2. Landscape

Supported device type
1. iPhone (no direct iPad support)

Input data:
1. CSV file


## File system

* ```Libs``` - Some external dependencies used by me (not written by my self but modified or improved),
for example **CSwiftV** (I've done some fixes for Swift 4)
* ```Resources``` - Some resources used by the app as the CSV file and the localization file
* ```Extensions``` - Extensions added to make the development more easy
* ```Models``` - Object models used to map input data (from CSV file) to a Swift Class
* ```Views``` - Some views, like table view cells
* ```Screens``` - Classes used for screens in the app, if there is a MVVM approach (CitiesTableViewController)
I keep the controller in another separated folder with the needed ViewModel class  


## Notes

* Most used and generic methods (like extensions) are documented directly in the code
* Each class (it's for UI representation or not) has multiple marks, I use this to easily
identify the needed part and keeps the code more readable (even if we loose more lines)
* I did not had images for all res types, so I've used only the best matching one, in a real project it's a good practice
to have them all
* The localization string file here is added more for the purpose to generalize the strings
but can easily used to add new language localizations (I always add localization file even if there is no need for that at
the first glance) 
* I've supposed that all images will be from the media-cdn.tripadvisor.com domain, so I've added only 
this domain to App Transport Security settings (security concerns)
* The only external dependency is **Kingfisher** library used for image downloading and caching added as
Pod dependency, **CSwiftV** was modified by me and added as source file for the project (with 
the link to the original source code)

