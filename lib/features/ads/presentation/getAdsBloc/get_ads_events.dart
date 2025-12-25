// Events
abstract class AdsEvent {}

class GetAdsEvent extends AdsEvent {}
class CarouselPageChanged extends AdsEvent {
  final int index;
  CarouselPageChanged(this.index);
}

class CarouselNextPage extends AdsEvent {
  final int length;
  CarouselNextPage(this.length);
}