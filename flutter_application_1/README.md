# flutter_application_1

I made this project as clean as I possibly could for my level.

Starting with the main.dart page I have set the provider which I used to recieve jobs from API and sorting them Acsendingly or Descendingly regarding the salary amount or alphabetically

First screen in this project is the HomeScreen which has the list of jobs displayed using a future builder inside a stream builder to check the connectivity of the internet at any point in real time during the running of the application, I've done my best to include every connection/status issue I could think of and set clauses accordingly. I've also used Consumers where I only needed to rebuild widgets and not on all the screen, increasing app performance. I've also used a switch widget to sort the list ascendingly in the UI or descendingly, next to pop menu items, helping the user decide which kind of sort they'd like to have. 

pressing each list item, gets the user to a different page which is the Job information screen where each job is described in details from an API, with an elevated buttona acting as a floating action button that navigates the user to the company's website.

the job card shared widget is used as a list tile items to display each job's title, company name, company logo and salary all from the API.

The JobModel class serves as a template for the needed data to be fetched from the API.

The JobRepo class / Repository class to determine what kind of data are we receiving (remote or local, in this case we don't have local data). Singleton type class to save memory and make it unable to create instances from its' constructor.

finally, the RemoteJobHandler/response handler class to handle all the data coming from the internet through APIs, which is also a singleton type class so we don't create an instance each time we use it, saving memory.

