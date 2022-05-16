# HappyFresh SQA/Test Engineer Assignment
###This android automation project is developed using:
- Robot Framework 5.0
- Python 3.10.4
- AppiumLibrary for Robot Framework 1.6.3
- Java 1.8.0_331
- Node.js v12.13.9
- Genymotion Android Emulator with Android SDK
- Android Emulator with Android version 9.0
- Pycharm IDE
- Windows 11

###How to run this automation project:
- _python -m robot -d result Test/testSuite.robot_
- After executing this command, result and log can be seen in _Result_ directory

Notes before running the command:
- In _Resources/keywords.robot_, "User open application" Keywords, change _deviceName_ to your connected device
- Use command _adb devices_ to get your device name