class AppStates {
  int count;
  AppStates({required this.count});
}

class InitState extends AppStates {
  InitState() : super(count: 3);
}
