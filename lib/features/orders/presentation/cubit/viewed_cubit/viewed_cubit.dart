

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_admin/core/models/viewed_model.dart';
import 'package:uuid/uuid.dart';

part 'viewed_state.dart';

class ViewedCubit extends Cubit<ViewedState> {
  ViewedCubit() : super(ViewedInitial());

  final Map<String, ViewedModel> historyItems = {};

  Map<String, ViewedModel> get getHistoryItems {
    return historyItems;
  }

  Future<void> addProductInHistory({required String productId}) async {
    historyItems.putIfAbsent(
        productId,
            () => ViewedModel(productId: productId, id: Uuid().v4()),
      );
      emit(AddProductInHistoryState());
    }
  }

