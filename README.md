# measure_ap

A new Flutter project.

## Getting Started (project setup)
A. prerequisites 
1. Flutter SDK
2. Android studio 
3. Xcode (for ios)
4. check any issuess with flutter installation in terminal by command -> flutter doctor

B. step by step setup
1. clone the public repository :
    git clone https://github.com/skisandesh/MeasureAp.git
2. go to the repository
    cd [repository_name]
3. install dependencies using terminal:
    flutter pub get
4. provide your sha fingerprints to the developer for firestore acess
    you can get sha fingerprints by using this command in terminal  -> keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
4. run the application 
    flutter run 


## Assumptions made during development 
- All the design and instructions were provide with detail So it was convient although few assumptions were made 
-- Recent history and recent assessments is provide through api so i integrate dummy data.


## challenges faced and how overcame 
1. Small challenges faced during code while generating methods and others were solved with the use of ChatGpt.
2. During firebase setup , i got error  "Module was compiled with an incompatible version of Kotlin." which was kind of error on the version collision of kotlin . ChatGpt doesn't provide suffiecient logic and resonable answer so via web surfying for hours i finally find the solution to my problem in StackOverflow .  