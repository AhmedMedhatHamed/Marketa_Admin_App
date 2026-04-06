part of 'viewed_cubit.dart';


@immutable
sealed class ViewedState {}

final class ViewedInitial extends ViewedState {}

class AddProductInHistoryState extends ViewedState{}
