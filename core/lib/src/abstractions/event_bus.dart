abstract class EventBus {
  Future<void> subscribe({
    required EventBusSubscriber eventBusSubscriber,
    required EventBusEvent event,
  });

  Future<void> unSubscribe({
    required EventBusSubscriber eventBusSubscriber,
    required EventBusEvent event,
  });

  Future<void> publish<T>({
    T? data,
    required EventBusEvent event,
  });
}

abstract class EventBusSubscriber {
  Future<void> onEventPublished<T>(
    T data,
    EventBusEvent event,
  );
}

class EventBusSubscription {
  final EventBusSubscriber subscriber;
  final EventBusEvent event;

  EventBusSubscription({
    required this.subscriber,
    required this.event,
  });
}

class EventBusEvent {
  final String eventId;

  EventBusEvent({
    required this.eventId,
  });
}
