import 'package:timeago/timeago.dart' as timeago;

String timeConverter(DateTime createdAt) {
  timeago.setLocaleMessages('ko', timeago.KoMessages());
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  final time = timeago.format(now.subtract(difference), locale: 'ko');
  return time;
}
