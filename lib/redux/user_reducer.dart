import 'package:dreader/model/user.dart';
import 'package:dreader/redux/d_reader_state.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

import 'middleware/epic.dart';
import 'middleware/epic_store.dart';

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
User _updateLoaded(User user, dynamic action) {
  user = action.userInfo;
  return user;
}

///定一个 UpdateUserAction ，用于发起 userInfo 的的改变 通过combineReducers-TypedReducer绑定就好
class UpdateUserAction {
  final User userInfo;

  UpdateUserAction(this.userInfo);
}

//请求用户信息标识
class FetchUserAction {}

/// 来源
/// import 'package:redux/src/utils.dart';
/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

class UserInfoMiddleware extends MiddlewareClass<DReaderState> {
  @override
  void call(Store<DReaderState> store, action, next) {
    if (action is UpdateUserAction) {
      print("*********** UserInfoMiddleware *********** ");
    }
    next(action);
  }
}

class UserInfoEpic implements EpicClass<DReaderState> {
  @override
  Stream call(Stream actions, EpicStore<DReaderState> store) {
    return Stream.value(actions)
        .whereType<FetchUserAction>()
        .switchMap((mapper) => _loadUserInfo());
  }

  // Use the async* function to make easier
  Stream<dynamic> _loadUserInfo() async* {
    print("*********** userInfoEpic _loadUserInfo ***********");
//    var res = await UserDao.getUserInfo(null);
    yield UpdateUserAction(User.empty());
  }
}
