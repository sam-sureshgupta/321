trigger Recursive_Trig on Account (before insert) {
    Recursive_Handler.callMe();
}