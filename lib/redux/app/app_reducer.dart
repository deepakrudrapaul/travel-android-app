import 'package:wanderwagon/redux/app/app_state.dart';
import 'package:wanderwagon/redux/feed/feed_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    feedState: feedReducer(state.feedState, action)
  );
}