class HttpException implements Exception {
  final String messsage;
  HttpException(this.messsage);

  @override
  String toString() {
    // TODO: implement toString
    return messsage;
  }
}
