part of 'views_manager_cubit.dart';

@immutable
abstract class ViewsManagerState {}

final class ViewsManagerInitial extends ViewsManagerState {}

final class CombinedView extends ViewsManagerState {}

final class SavedView extends ViewsManagerState {}

final class AudioView extends ViewsManagerState {}

final class ProfileView extends ViewsManagerState {}
