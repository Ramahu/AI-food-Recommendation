# AI Food Recommendation System

The User Diet Analysis Application is an intelligent system designed to assist users in determining a suitable dietary plan based on a specific health goal they define, such as weight gain, weight loss, maintenance, or muscle building. This is achieved by suggesting a set of meals tailored to the inputs provided by the user, including weight, age, height, medical conditions, and the desired goal. The proposed plan adheres to recognized medical standards, ensuring its appropriateness for the user’s needs.


 you can find the AI  model here : https://github.com/Ramahu/Food-Recommendation-Python/tree/main

 
## Presentation :

https://github.com/user-attachments/assets/bbbdef20-5bb3-4ce4-a206-d1b843509514

## Promo : 


https://github.com/user-attachments/assets/cf599051-b256-4860-9df0-3c01454ac31b


## Demo : 


https://github.com/user-attachments/assets/a080528a-56e2-4cc2-83f0-f155798dfe1d



## Use Case Diagram :

![use case2](https://github.com/user-attachments/assets/3699d7de-9450-43d2-bd57-457693e7a0a3)


## Functional Requirements :

 1- Login :
The system allow users to securely log in using their registered credentials.
Login include validation for email and password.

2- Create Account :
The system enable users to create a new account by providing necessary information such as:
Name , Email , Password , Gender .


3- Health Questionnaire :
The system allow users to complete a health questionnaire to gather personal data essential for determining individualized dietary needs.
Questionnaire Fields : Age , Gender , Height , Weight , Allergies ,
Activity Level ( Option to specify if the user is athletic or sedentary) ,
Goal ( Weight gain , Weight loss , Weight maintenance , Muscle building ) ,
Health Conditions ( select options for pre-existing medical conditions ) ,
Diet Preference ( Whether the user is vegetarian or non-vegetarian ) .

4- Display of Daily Nutritional Values:
Provides a daily summary of essential nutritional values such as calories, protein, sodium ,carb , sugar , fiber , cholesterol , fat and saturatedfat based on the user's needs.

5- Display of Nutritional Values and Suggested Foods for Each Meal:
Suggests suitable foods based on the targeted nutritional values for each meal of the day (breakfast, lunch, dinner).

6- Display All Details of Suggested Foods:
Allows users to view complete details of the suggested foods, including nutritional values, ingredients, and calorie content.

7- Add Food to Favorites:
  Allows users to add their preferred foods to a favorites list for easy access.  

8- Remove Food from Favorites:
 Enables users to delete foods from their favorites list.  

9- View All Favorite Foods:
Provides users with the ability to view all the foods saved in their favorites list. 

10- Search for Food by Nutritional Components: 
Allows users to search for foods based on specific nutritional components.

11- Logout:
Enables users to securely log out of their accounts, ensuring their session is terminated.


## Interface : 

Splash screen and onboarding :

![5920228804398269624](https://github.com/user-attachments/assets/8a6735e6-602d-42e1-a5e0-b10e5f5e9518)

Login , Create account , Drawer , Home page :

![Mobile App Screen Mockup, Floating](https://github.com/user-attachments/assets/360031bb-4416-4ffb-9ea2-a6b4e3d4be40)

Nutritional Values and Suggested Foods for Each Meal , Health Questionnaire :

![Mobile App Screen Mockup, Floating (1)](https://github.com/user-attachments/assets/c25e6382-1005-43f6-92cf-192f6e8f81f2)

Search for Food , Details of Foods , Show Favorites Food:

![Mobile App Screen Mockup, Floating (2)](https://github.com/user-attachments/assets/5c4be46f-5b1e-4398-b127-5bff6fa2130b)

 Show Favorites Food , Delete from Favorites Food :

![Mobile App Screen Mockup, Floating (5)](https://github.com/user-attachments/assets/3dcab0de-1135-4b2f-8967-afa82843b8a1)


## Technology Stack for the AI Food Recommendation System :

Frontend: Built using Flutter with the following tools and libraries:

1- State Management:

BLoC (Business Logic Component): Implements the separation of business logic and UI for predictable state management.
Provides a scalable and testable architecture.

![5800727494075206081](https://github.com/user-attachments/assets/9106dd87-ec1e-44fc-9de6-ae7276c841f2)


2- API Integration:

Dio: Handles advanced REST API integration, including interceptors, authentication, and error handling.
Caching:

3- Caching : 

Shared Preferences: Stores user data locally, such as login credentials, user preferences, and settings.

4- UI Enhancements:

Google Fonts: Adds a variety of customizable and visually appealing fonts to the application.

Water Drop Navigation Bar: Creates an interactive and visually engaging bottom navigation bar.

Flutter Advanced Drawer: Provides a sleek and customizable navigation drawer.

Neumorphic UI: Implements modern, soft design elements for an aesthetically pleasing user interface.

Flutter Onboarding: Facilitates smooth onboarding flows to introduce app features to new users.

