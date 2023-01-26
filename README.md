
# react-native-panda-fun-facts

## Getting started

`$ npm install react-native-panda-fun-facts --save`

### Mostly automatic installation

`$ react-native link react-native-panda-fun-facts`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-panda-fun-facts` and add `RNPandaFunFacts.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPandaFunFacts.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNPandaFunFactsPackage;` to the imports at the top of the file
  - Add `new RNPandaFunFactsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-panda-fun-facts'
  	project(':react-native-panda-fun-facts').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-panda-fun-facts/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-panda-fun-facts')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNPandaFunFacts.sln` in `node_modules/react-native-panda-fun-facts/windows/RNPandaFunFacts.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Panda.Fun.Facts.RNPandaFunFacts;` to the usings at the top of the file
  - Add `new RNPandaFunFactsPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNPandaFunFacts from 'react-native-panda-fun-facts';

// TODO: What to do with the module?
RNPandaFunFacts;
```
  