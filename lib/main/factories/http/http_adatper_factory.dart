import 'package:http/http.dart';

import '../../../data/data.dart';
import '../../../infra/http/http.dart';

HTTPClient makeHTTPAdapter() => HTTPAdapter(makeHTTPClient());

Client makeHTTPClient() => Client();
