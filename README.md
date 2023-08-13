# Automation Exercise using robot-framework
This project aims to implement the proposed exercises using Robot Framework.
There are some dependencies that are needed for this project to be executed. As follow:
**Libraries:**
- SeleniumLibrary
- Collections
- String
- RequestsLibrary
- JSONLibrary

**Packages:**
- robotframework
- robotframework-seleniumlibrary
- robotframework-requests
- robotframework-jsonlibrary
- chromedriver: Download the package corresponding to your Google Chrome version from [here](https://sites.google.com/a/chromium.org/chromedriver/downloads). And add the downloaded file path to $PATH, or move the downloaded file to `/usr/local/bin/chromedriver/`
- Python 3.11.4

The exercises can be found in `packages/automation/exercise2/Tests/ExerciseSauceDemo/Exercise1.robot` and `packages/automation/exercise2/Tests/ExerciseSauceDemo/Exercise2.robot`. To execute the exercise do the following:
1. After installing the dependencies.
2. Open `cmd`.
3. Run `git clone git@github.com:dbrsilva/robot-framework-exercise.git`.
5. Go to the root of the project folder.
6. To execute exercise 1 run `robot -d results packages/automation/exercise1/Tests/` to execute the exercise.
7. To execute exercise 2 run `robot -d results packages/automation/exercise2/Tests/ExerciseSauceDemo/` to execute the exercise.
8. Verify the reports on `./results`
