part of '../dependency_injection.dart';

@riverpod
RestClientKit network(NetworkRef ref) {
  return RestClientKit(
    baseUrl: Endpoints.base,
    onUnAuthorizedError: () {},
  );
}
