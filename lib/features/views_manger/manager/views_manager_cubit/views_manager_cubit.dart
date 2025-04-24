import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'views_manager_state.dart';

class ViewsManagerCubit extends Cubit<ViewsManagerState> {
  ViewsManagerCubit() : super(CombinedViewState());
  void navigateToPage(int pageNum) {
    if (pageNum == 0) {
      emit(CombinedViewState());
    } else if (pageNum == 1) {
      emit(SavedViewState());
    } else if (pageNum == 2) {
      emit(AudioViewState());
    } else {
      emit(ProfileViewState());
    }
  }
}
