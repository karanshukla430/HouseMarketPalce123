import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyCORpOZCM3oxZE0scs2x1U3JK2jA7MsXDE",
  authDomain: "house-marketplace-app-686f8.firebaseapp.com",
  projectId: "house-marketplace-app-686f8",
  storageBucket: "house-marketplace-app-686f8.appspot.com",
  messagingSenderId: "220809703831",
  appId: "1:220809703831:web:bc16cdcd590a6e516b94d2",
};

// Initialize Firebase
initializeApp(firebaseConfig);
export const db = getFirestore();
