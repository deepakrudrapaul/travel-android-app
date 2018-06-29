import 'package:wanderwagon/redux/app/app_state.dart';
import 'package:wanderwagon/ui/feed/feed.dart';


List<Feed> feedsSelector(AppState state) => state.feedState.feeds;