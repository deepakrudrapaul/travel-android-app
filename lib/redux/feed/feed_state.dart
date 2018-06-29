import 'package:meta/meta.dart';
import 'package:wanderwagon/models/loading_status.dart';
import 'package:wanderwagon/ui/feed/feed.dart';


@immutable
class FeedState {

  final LoadingStatus loadingStatus;
  final List<Feed> feeds;

  FeedState({
    this.loadingStatus,
    this.feeds
  });

  factory FeedState.initial() {
    return FeedState(
      loadingStatus: LoadingStatus.loading,
      feeds: <Feed>[]
    );
  }


  FeedState copyWith({
    LoadingStatus loadingStatus,
    List<Feed> feeds
  }) {
    return FeedState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      feeds: feeds ?? this.feeds
    );
  }


}