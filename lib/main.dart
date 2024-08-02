import 'package:flutter_clean_arch_crypto_app/features/authentication/presentation/pages/login_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/network/network_info.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'features/authentication/data/repositories/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/signin_with_email_and_password.dart';
import 'features/authentication/presentation/provider/auth_provider.dart';
import 'features/explore/presentation/pages/explore_page.dart';
import 'features/explore/presentation/pages/my_assets_page.dart';
import 'features/explore/presentation/pages/top_movers_page.dart';
import 'features/transactions/data/datasources/tezos_transactions_remote_data_source.dart';
import 'features/transactions/data/datasources/transactions_remote_data_source.dart';
import 'features/transactions/data/repositories/tezos_transactions_repository_impl.dart';
import 'features/transactions/data/repositories/transactions_repository_impl.dart';
import 'features/transactions/domain/repositories/tezos_transactions_repository.dart';
import 'features/transactions/domain/repositories/transactions_repository.dart';
import 'features/transactions/domain/usecases/get_tezos_transactions_for_block.dart';
import 'features/transactions/domain/usecases/get_transactions_for_block.dart';
import 'features/transactions/presentation/pages/tezos_transaction_details_page.dart';
import 'features/transactions/presentation/pages/tezos_transactions_list_page.dart';
import 'features/transactions/presentation/pages/transaction_details_page.dart';
import 'features/transactions/presentation/pages/transactions_list_page.dart';
import 'features/transactions/presentation/provider/tezos_transactions_provider.dart';
import 'features/transactions/presentation/provider/transactions_provider.dart';
import 'firebase_options.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  runApp(const CryptoApp());
}

void setupDependencies() {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: Connectivity(),
      ));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<TransactionsRemoteDataSource>(
    () => TransactionsRemoteDataSourceImpl(dio: Dio()),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TransactionsRepository>(
    () => TransactionsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInWithEmailAndPassword(sl()));
  sl.registerLazySingleton(() => GetTransactionsForBlock(sl()));

  // Providers
  sl.registerFactory(() => AuthProvider(signInWithEmailAndPassword: sl()));
  sl.registerFactory(() => TransactionsProvider(getTransactionsForBlock: sl()));

  // Tezos Transactions
  sl.registerLazySingleton<TezosTransactionsRemoteDataSource>(
    () => TezosTransactionsRemoteDataSourceImpl(dio: Dio()),
  );
  sl.registerLazySingleton<TezosTransactionsRepository>(
    () => TezosTransactionsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetTezosTransactionsForBlock(sl()));
  sl.registerFactory(
      () => TezosTransactionsProvider(getTransactionsForBlock: sl()));
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => sl<TransactionsProvider>()),
        ChangeNotifierProvider(create: (_) => sl<TezosTransactionsProvider>()),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Login with Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFF12A633),
          ),
        ),
        routes: {
          ExplorePage.routeName: (_) => const ExplorePage(),
          TransactionsListPage.routeName: (_) => const TransactionsListPage(),
          TransactionDetailsPage.routeName: (_) =>
              const TransactionDetailsPage(),
          TezosTransactionsListPage.routeName: (_) =>
              const TezosTransactionsListPage(),
          TezosTransactionDetailsPage.routeName: (_) =>
              const TezosTransactionDetailsPage(),
          MyAssetsPage.routeName: (_) => MyAssetsPage(),
          TopMoversPage.routeName: (_) => TopMoversPage(),
        },
        home: const LoginPage(),
      ),
    );
  }
}
