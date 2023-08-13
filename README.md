# Automation Exercise using robot-framework
This project aims to implement the proposed exercises using Robot Framework.
There are some dependencies that are needed for this project to be executed. As follow:
**Libraries:**
- SeleniumLibrary
- Collections
- String

**Packages:**
- robotframework
- robotframework-seleniumlibrary
- chromedriver: Download the package corresponding to your Google Chrome version from [here](https://sites.google.com/a/chromium.org/chromedriver/downloads). And add the downloaded file path to $PATH, or move the downloaded file to `/usr/local/bin/chromedriver/`
- Python 3.11.4

The exercises can be found in `Tests/ExerciseSauceDemo/Exercise1.robot` and `Tests/ExerciseSauceDemo/Exercise2.robot`. To execute the exercise do the following:
1. Open `cmd`.
2. Go to the root of the project folder.
3. Run `robot -d results Tests/ExerciseSauceDemo/` to execute the exercise.
4. Verify the report on `./results`
