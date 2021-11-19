import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect myConfigHasuraConnect() {
  String url = 'https://higia.herokuapp.com/v1/graphql';
  return HasuraConnect(url);
}
