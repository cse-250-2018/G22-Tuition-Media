Instructions :
--------------

- **Adding/Updating the extension**
  - Click the Extensions button in the Side Bar.
  - Next time if::
  - Install both flutter and Dart extension.
  - If the Flutter extension is shown with an available update, click the update button and then the reload button.
  - If the Dart extension is shown with an available update, click the update button and then the reload button.
  - Restart VS Code.
  
- **Creating Project**
  - Open the Command Palette (Ctrl+Shift+P ) for windows,(Cmd+Shift+P on macOS).
  - Select the Flutter: New Project command and press Enter.
  - Select Application and press Enter.
  - Select a Project location.
  - Enter your desired Project name.
  
- **Can debug project by clicking "debug and run" option on the left side**
- **One can use Emulator to debug/run the app. other way is to use one's mobile as the target device. To use Mobile as a target device one have to on developers option on his/her mobile.**
- **To add assets one have to add path link in pubspec.yaml file.**


- **Clone project from github then edit it on your Preffered IDE**

Handling database
-----------------
-**See how to SetUp Firebase on your app .[https://firebase.google.com/docs/flutter/setup?platform=ios]**
 - To get SHA key for windows :
 - create keystore file by  follow these commands :
 - 1. For creating the keystore file 
 - keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000

 - 2. For viewing the SHA-1 key from the keystore file that we created 

 - keytool -list -v -keystore "C:\Users\Shivansh Singh["Replace with your uername"]\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android


#FAQ
-----
- **While fetching data from the database you may see some errors, there could be many reasons. To solve them   you can follow them :**
  - one of the field data maybe NULL but you are accessing it.
  - you might have created Field for taking input from user ,but havn't designed it in particular Model.
  - spelling mistakes.
  - *check vesion related problems,one versions code might not run on other version of dart*
  - To stay up to date with flutter version you can run  *'flutter pub upgrade'* command.
  - If any error occurs in Gradle, one might not find what's the problem. then you should open another folder    for this project and copy your assets, pubspec.yaml file and codes there.
  
  - One might face a problem if he/she uses one email account for registering more than one account. 
    -There is an option to resolve this :: one have to Allow *Multiple accounts per email address* in signin method of Authentication

![Screenshot 2022-01-05 235326](https://user-images.githubusercontent.com/52748765/148265223-6cb7390f-6035-44e7-a22f-70f71540d542.png)


- **If anything more needed search in on goolge and Flutter have an excellent documentation**
