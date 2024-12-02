import { db } from "@/lib/firebase";
import { User } from "firebase/auth";
import { doc, getDoc, setDoc } from "firebase/firestore";

export const    setUserDetails = async (user: User, userType : string) => {
  const userDocRef = doc(db, userType, user.uid);
  const docSnapshot = await getDoc(userDocRef);

  if (!docSnapshot.exists()) {
    await setDoc(userDocRef, {
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      uid: user.uid,
      userType: userType,
      createdAt: new Date(),
      phone: user.phoneNumber,
      testHistory: [],
    });
  }
};
