# Activity2

Name:                           Student ID:
NAVLEEN KAUR           c0735885
MANPREET KAUR        c0728803


Theoretical Question-Answers:

Q1: On the IOS side, what function is used to receive messages from the watch?
Ans: On the IOS side, following function is used to receive messages from the watch:

func session(_session: WCSession, didReceiveMessage message: [String : Any]) {
}


Q2: When receiving messages from the watch, you need to use a closure function. What is the reason why a closure is used?
Ans: A closure is used to maintain a private reference to a variable in the outer scope.
