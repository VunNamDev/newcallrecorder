// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on _AppStore, Store {
  final _$arrAllAtom = Atom(name: '_AppStore.arrAll');

  @override
  List<FileItem> get arrAll {
    _$arrAllAtom.context.enforceReadPolicy(_$arrAllAtom);
    _$arrAllAtom.reportObserved();
    return super.arrAll;
  }

  @override
  set arrAll(List<FileItem> value) {
    _$arrAllAtom.context.conditionallyRunInAction(() {
      super.arrAll = value;
      _$arrAllAtom.reportChanged();
    }, _$arrAllAtom, name: '${_$arrAllAtom.name}_set');
  }

  final _$arrInComingAtom = Atom(name: '_AppStore.arrInComing');

  @override
  List<FileItem> get arrInComing {
    _$arrInComingAtom.context.enforceReadPolicy(_$arrInComingAtom);
    _$arrInComingAtom.reportObserved();
    return super.arrInComing;
  }

  @override
  set arrInComing(List<FileItem> value) {
    _$arrInComingAtom.context.conditionallyRunInAction(() {
      super.arrInComing = value;
      _$arrInComingAtom.reportChanged();
    }, _$arrInComingAtom, name: '${_$arrInComingAtom.name}_set');
  }

  final _$arrOutGoingAtom = Atom(name: '_AppStore.arrOutGoing');

  @override
  List<FileItem> get arrOutGoing {
    _$arrOutGoingAtom.context.enforceReadPolicy(_$arrOutGoingAtom);
    _$arrOutGoingAtom.reportObserved();
    return super.arrOutGoing;
  }

  @override
  set arrOutGoing(List<FileItem> value) {
    _$arrOutGoingAtom.context.conditionallyRunInAction(() {
      super.arrOutGoing = value;
      _$arrOutGoingAtom.reportChanged();
    }, _$arrOutGoingAtom, name: '${_$arrOutGoingAtom.name}_set');
  }

  final _$arrFavoriteAtom = Atom(name: '_AppStore.arrFavorite');

  @override
  List<FileItem> get arrFavorite {
    _$arrFavoriteAtom.context.enforceReadPolicy(_$arrFavoriteAtom);
    _$arrFavoriteAtom.reportObserved();
    return super.arrFavorite;
  }

  @override
  set arrFavorite(List<FileItem> value) {
    _$arrFavoriteAtom.context.conditionallyRunInAction(() {
      super.arrFavorite = value;
      _$arrFavoriteAtom.reportChanged();
    }, _$arrFavoriteAtom, name: '${_$arrFavoriteAtom.name}_set');
  }

  final _$playItemAtom = Atom(name: '_AppStore.playItem');

  @override
  FileItem get playItem {
    _$playItemAtom.context.enforceReadPolicy(_$playItemAtom);
    _$playItemAtom.reportObserved();
    return super.playItem;
  }

  @override
  set playItem(FileItem value) {
    _$playItemAtom.context.conditionallyRunInAction(() {
      super.playItem = value;
      _$playItemAtom.reportChanged();
    }, _$playItemAtom, name: '${_$playItemAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void addArrAll(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addArrAll(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArrInComing(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addArrInComing(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArrOutGoing(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addArrOutGoing(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArrAll(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.removeArrAll(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArrInComing(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.removeArrInComing(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArrOutGoing(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.removeArrOutGoing(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrAll(List<FileItem> arrAll) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeArrAll(arrAll);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrInComing(List<FileItem> arrInComing) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeArrInComing(arrInComing);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrOutGoing(List<FileItem> arrOutGoing) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeArrOutGoing(arrOutGoing);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changearrFavorite(List<FileItem> arrFavorite) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changearrFavorite(arrFavorite);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePlayItem(FileItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changePlayItem(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addarrFavorite(FileItem item, {dynamic del = false}) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addarrFavorite(item, del: del);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
