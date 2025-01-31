import 'package:flutter/material.dart';
import '../models/user_login_model.dart';
import '../repositories/main_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final MainRepository _mainRepository;
  bool _isLoading = false;
  String? _errorMessage;
  UserLoginModel? _user;

  LoginViewModel(this._mainRepository);

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserLoginModel? get user => _user;

  Future<UserLoginModel?> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _mainRepository.login(email, password);
      return _user;
    } catch (e) {
      _errorMessage = e.toString();
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _mainRepository.register(
        username: username,
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
