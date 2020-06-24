import 'package:creditcard/repositorys/log.repository.dart';

class LogController {
  LogRepository logRepository;

  LogController() {
    logRepository = new LogRepository();
  }

  Future<dynamic> obter() async {
    var resp = await logRepository.obter();
    print(resp);
    return resp;
  }
}