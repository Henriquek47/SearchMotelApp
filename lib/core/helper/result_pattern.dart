class Result<T> {
  final bool doNotShow;
  final bool isSuccess;
  final bool isFailure;
  final bool isWarning;
  final bool isInfo;
  final T? data;
  final String? messageCode;

  Result.doNotShow({this.messageCode, this.data, this.doNotShow = true})
      : isSuccess = true,
        isFailure = false,
        isWarning = false,
        isInfo = false;

  Result.success({this.messageCode, this.data, this.doNotShow = false})
      : isSuccess = true,
        isFailure = false,
        isWarning = false,
        isInfo = false;

  Result.failure({this.messageCode, this.data, this.doNotShow = false})
      : isSuccess = false,
        isFailure = true,
        isWarning = false,
        isInfo = false;

  Result.warning({this.messageCode, this.data, this.doNotShow = false})
      : isSuccess = false,
        isFailure = false,
        isWarning = true,
        isInfo = false;

  Result.info({this.messageCode, this.data, this.doNotShow = false})
      : isSuccess = false,
        isFailure = false,
        isWarning = false,
        isInfo = true;

  bool get isValid => isSuccess || isFailure || isWarning || isInfo;
}
