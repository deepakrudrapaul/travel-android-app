import 'package:redux/redux.dart';
import 'package:wanderwagon/models/loading_status.dart';
import 'package:wanderwagon/redux/feed/feed_actions.dart';
import 'package:wanderwagon/redux/feed/feed_state.dart';


final feedReducer = combineReducers<FeedState>([
  TypedReducer<FeedState, LoadFeed>(_loadFeed),
  TypedReducer<FeedState, LoadFeedSuccessful>(_loadFeedSuccessful),
  TypedReducer<FeedState, LoadFeedFail>(_loadFeedFail)
]);


FeedState _loadFeed(FeedState state, LoadFeed action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}


FeedState _loadFeedSuccessful(FeedState state, LoadFeedSuccessful action) {
  return state.copyWith(loadingStatus: LoadingStatus.success, feeds: action.feeds);
}


FeedState _loadFeedFail(FeedState state, LoadFeedFail action) {
  return state.copyWith(loadingStatus: LoadingStatus.error);
}

