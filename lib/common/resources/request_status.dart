import 'package:drug_interaction_detector/common/utils/custom_message_bar.dart';

class RequestStatus {
  Status status = Status.notCalled;
  String? _message;

  get message => _message ?? 'خطایی رخ داده است';

  void loading() {
    status = Status.loading;
  }

  void success({String? message}) {
    status = Status.success;
    if (message != null) {
      CustomMessageBar.makeSnackBar(message: message, type: SnackType.success);
    }
  }

  void notCalled() {
    status = Status.notCalled;
  }

  void error(String message, {bool showMessage = true}) {
    status = Status.error;
    _message = message;
    if (showMessage) {
      CustomMessageBar.makeSnackBar(message: message, type: SnackType.error);
    }
  }

  void clear() {
    status = Status.notCalled;
    _message = null;
  }
}

enum Status {
  notCalled,
  loading,
  success,
  error,
}
