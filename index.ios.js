/**
 * Sample React Native Driven IOS Keyboard
 * https://github.com/facebook/react-native
 */

'use strict';
import React from 'react'
import ReactNative from 'react-native'
const {
  AppRegistry,
  StyleSheet,
  Text,
  TextInput,
  View,
  ScrollView,
  TouchableOpacity,
} = ReactNative

var TextCommunications = require('NativeModules').TextCommunications;
var Icon = require('react-native-vector-icons/FontAwesome');

class RNKeyboardSampleApp extends React.Component {

  doNextKeyboard = () => {
    TextCommunications.advanceToNextInputMode();
  };

  doInsertText = () => {
    TextCommunications.insertText('I was inserted from custom RN keyboard');
  }

  render() {
    return (
      <View style={styles.container}>
        <ScrollView style={styles.scrollContainer} contentContainerStyle={styles.scrollContentContainer}>
          <Text>Content Goes Here</Text>
        </ScrollView>

        <View style={styles.bottomBarContainer}>
          <TouchableOpacity onPress={this.doNextKeyboard} style={[styles.bottomBarItemWrap, styles.bottomBarItemActive]}>
            <Text style={[styles.bottomBarText, styles.bottomBarTextActive]}>Next KB</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={this.doInsertText} style={[styles.bottomBarItemWrap]}>
            <Text style={[styles.bottomBarText, styles.bottomBarTextActive]}>Txt 1</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={this.doInsertText} style={styles.bottomBarItemWrap}>
            <Text style={[styles.bottomBarText]}>Txt 2</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  }

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#ffffff',
  },
  scrollContainer: {
    flex: 1,
    backgroundColor: '#f5ffff',
  },
  scrollContentContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  bottomBarContainer: {
    borderTopWidth: 1,
    borderColor: '#ccc',
    flexDirection: 'row',
    paddingVertical: 0,
  },
  bottomBarItemWrap: {
    paddingVertical: 8,
    alignItems: 'center',
    flex: 1,
  },
  bottomBarItemWrapIcon: {
    padding: 0,
  },
  bottomBarItemActive: {
    backgroundColor: '#ccc',
  },
  bottomBarIcon: {
    margin: -5,
  },
  bottomBarText: {
    color: '#000000',
  },
  bottomBarTextActive: {
    color: '#000000',
  },
});

AppRegistry.registerComponent('RNKeyboardSampleApp', () => RNKeyboardSampleApp);
