# RNKeyboardSampleApp

Example of a custom IOS Keyboard leveraging React Native

### To run in simulator:

  1. Running RNKeyboardSampleApp target will open the RN app as a full screen app.  Useful for general development and debugging.

  2. Running the "RN Sample Keyboard" target will install the keyboard into the simulator.
    a. In simulator press command+shift+h to go to home screen, then open settings app
    b. In Settings -> General -> Keyboards add your custom keyboard
    c. Switch back to Safari or any other app with a text input available.  Focus that input.
    d. Make sure you do command+shift+k to make simulator keyboard appear
    e. Hit "next keyboard" button to advance to your custom keyboard

### To run on device:

  1. Be sure to edit jsCodeLocation in /ios/RN\ Sample\ Keyboard/KeyboardViewController.m
