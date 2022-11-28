import 'package:core/src/abstractions/event_bus.dart';

class EventBusImpl implements EventBus {
  final List<EventBusSubscription> _subscriptions = [];

  @override
  Future<void> publish<T>({
    T? data,
    required EventBusEvent event,
  }) {
    _subscriptions
        .where((element) => element.event.eventId == event.eventId)
        .forEach((element) {
      element.subscriber.onEventPublished(
        data,
        event,
      );
    });
    return Future.value();
  }

  @override
  Future<void> subscribe({
    required EventBusSubscriber eventBusSubscriber,
    required EventBusEvent event,
  }) {
    _subscriptions.add(
      EventBusSubscription(
        subscriber: eventBusSubscriber,
        event: event,
      ),
    );
    return Future.value();
  }

  @override
  Future<void> unSubscribe({
    required EventBusSubscriber eventBusSubscriber,
    required EventBusEvent event,
  }) {
    _subscriptions.removeWhere(
      (element) =>
          element.subscriber == eventBusSubscriber &&
          element.event.eventId == event.eventId,
    );
    return Future.value();
  }
}
