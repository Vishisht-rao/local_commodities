const admin = require('./node_modules/firebase-admin');
const serviceAccount = require("./seriviceAccountKey.json");
const data = require("./data.json");
const collectionKey = "Items"; //name of the collection
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://local-commodities.firebaseio.com"
});
const firestore = admin.firestore();
const settings = {timestampsInSnapshots: true};
firestore.settings(settings);
if (data && (typeof data === "object")) {
Object.keys(data).forEach(Items => {
 firestore.collection(collectionKey).doc(Items).set(data[Items]).then((res) => {
    console.log("Document " + Items + " successfully written!");
}).catch((error) => {
   console.error("Error writing document: ", error);
});
});
}