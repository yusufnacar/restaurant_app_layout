// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsViewModel on _DetailsViewModelBase, Store {
  final _$markersAtom = Atom(name: '_DetailsViewModelBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$_DetailsViewModelBaseActionController =
      ActionController(name: '_DetailsViewModelBase');

  @override
  void mapMarker() {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.mapMarker');
    try {
      return super.mapMarker();
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers}
    ''';
  }
}
