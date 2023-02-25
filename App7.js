import { StyleSheet, ImageBackground } from 'react-native';
import { useState } from 'react';
import StartGameScreen from './screens/StartGameScreen';
import GameScreen from './screens/GameScreen';
import { LinearGradient } from 'expo-linear-gradient';

export default function App() {

  const [userNumber, setUserNumber] = useState();

  function pickedNumberHandler(pickedNumber) {
    setUserNumber(pickedNumber);
  }

  let screen = <StartGameScreen onPickNumber={pickedNumberHandler}/>

  if (userNumber) {
    screen = <GameScreen/>
  }

  return (
    <LinearGradient colors={['#4e0329', '#ddb52f']} style={styles.rootScreen}>
      <ImageBackground
        source={require('./assets/images/background.jpg')}
        resizeMode="cover"
        style={styles.rootScreen}
        imageStyle={styles.backgroundImage}
      >
        {screen}
      </ImageBackground>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  rootScreen: {
    flex: 1,
  },
  backgroundImage: {
    opacity: 0.15
  }
});