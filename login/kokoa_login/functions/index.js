const functions = require("firebase-functions");
const admin = require("firebase-admin");
const auth = require("firebase-auth");

var serviceAccount = require("./loginkakao-41228-firebase-adminsdk-kr7c1-b432a09046.json"); // 키 패스

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//

exports.createCustomToken = functions.https.onRequest(async (request, response) => {
    const user = request.body;

    const uid = `kakao:${user.uid}`;
    const updateParams = { // 정보들을 uid 빼고 다시 가공함 
    email: user.email,
    photoURL: user.photoURL,
    displayName: user.displayName,
    };

    try {
        await admin.auth().updateUser(uid, updateParams);
    } catch (e) {
        updateParams["uid"] = uid;
        await admin.auth().createUser(updateParams); // 여기에 유저를 던지면
        // 파이어 베이스에 유저가 추가가 됨 
        // 추가가된 유저의 id를 가지고 토큰을 만들어 줘야함
        // 매번 이렇게 하면 유저가 이미 있는 상황에서 또 생성 할수 있으니까
        //  const uid = `kakao:${user.uid}`; 위에 uid 앞에 카카오를 붙임

    }
    
    const token = await admin.auth().createCustomToken(uid); // 토큰 생성
    
    response.send(token); // 토큰 돌려줌 
});
