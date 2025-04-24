import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'views_manager_state.dart';

class ViewsManagerCubit extends Cubit<ViewsManagerState> {
  ViewsManagerCubit() : super(ViewsManagerInitial());
  void navigateToPage(int pageNum) {
    if (pageNum == 0) {
      emit(CombinedView());
    } else if (pageNum == 1) {
      emit(SavedView());
    } else if (pageNum == 2) {
      emit(AudioView());
    } else {
      emit(ProfileView());
    }
  }
}
