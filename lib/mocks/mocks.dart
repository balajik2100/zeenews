import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:zeenews/interfaces/ZeeNewsAPIInterface.dart';

class MockClient extends Mock implements http.Client {}
class MockSwapiService extends Mock implements ZeeNewsAPIInterface {}