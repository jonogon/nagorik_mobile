import 'package:rest_client_kit/rest_client_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../feature/authentication/data/data_sources/authentication_data_source.dart';
import '../../feature/authentication/data/repositories/authentication_repository_impl.dart';
import '../../feature/authentication/domain/use_cases/authentication_use_cases.dart';
import '../services/network/endpoints.dart';

part 'dependency_injection.g.dart';
part 'parts/data_source.dart';
part 'parts/externals.dart';
part 'parts/repository.dart';
part 'parts/services.dart';
part 'parts/use_case.dart';
