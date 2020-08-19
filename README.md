# CollectionViewContainer
From https://podlodka.io/ioscrew-2 session

# Intro
Demo project shows the power of CollectionViewContainer from splitting one screen into modules
For logic I took MVVM pattern, to avoid dependencies I used Combine (it was the first time I used it, so not sure it's correct), but RxSwift is a good choice for such approach.

I tried to find a compromise between having all components that explain the concept and remove all helpers that are not needed for the demo. So if anything is not clear, feel free to contact me in telegram: @azimin

# Unnecessary
Has `ProfileService` that simulate the loading of username and service that provides data

# Core
## CollectionHelpers
Contains all helpers related to collection view
## Other
Contains all logic related to CollectionViewContainer pattern
* CollectionViewController
* CollectionViewDataSource
* CollectionViewContainer
* ViewHolder

# Cells
Contains 3 presented cells

# ViewExample
Has the next structure:
* DataSources – contains all 3 presented data sources
* ProfileView – view of a root view
* ProfileViewController – view controller of a root view (usually used for binding view and view model)
* ProfileViewModel – view model of a root view

# DataSources inside ViewExample
Each data source contains 2 components: viewModel and dataSource
Inside `ProfileHeaderDataSource` I showed how to work with auto height
