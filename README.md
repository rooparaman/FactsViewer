# Facts Viewer

**Facts Viewer** is an universal iOS app that displays the json information through an api call

## Technicalities
- **MVVM** is used as the architectural design pattern
- Boxing technique in swift has been used for data binding between the view and the view models
- Best works with iOS 12 and above
- The app has been designed to give a consistent user view across all orientations and all devices

## Project Structure
- **Helpers** - Common functionality that is used across the project
- **Services** - Contains all the api service related functionality
- **View Models** - Contains classes that acts as VM in the MVVM
- **Views** - The UI presentation logic sits here
- **Data Mappers** - Maps the api data to Model
- **Data Models** - Contains classes that conforms to codable that represent the api data
- **Models** - Contains the actual business models
- **Test** - Contains the unit & UI tests
