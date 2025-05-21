import 'package:flutter_bloc/flutter_bloc.dart';

part 'views_manager_state.dart';

class ViewsManagerCubit extends Cubit<ViewsManagerState> {
  ViewsManagerCubit() : super(CombinedViewState());
  int index = 0;
  void navigateToPage(int pageNum) {
    if (pageNum == 0) {
      index = 0;
      emit(CombinedViewState());
    } else if (pageNum == 1) {
      index = 1;
      emit(SavedViewState());
    } else {
      index = 3;
      emit(ProfileViewState());
    }
  }

  int whatIndex() {
    emit(ViewsManagerInitial());
    return index;
  }
}
