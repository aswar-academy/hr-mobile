import 'package:aswar/common_libs.dart';

class User {}

abstract class UserRepository {
  late final double named;

  Future<User> fetchUser(String cityName) async {
    return User();
  }
}

class FakeUserRepository implements UserRepository {
  @override
  late final double named;

  static final provider = Provider((_) => FakeUserRepository());

  @override
  Future<User> fetchUser(String cityName) async {
    return User();
  }
}

final userProvider = FutureProvider.family<User, String>((ref, city) {
  final repo = ref.watch(FakeUserRepository.provider);
  return repo.fetchUser(city);
});

class UserWidget extends ConsumerWidget {
  const UserWidget({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: ref.watch(userProvider('Siena')).when(
            data: (user) => const Center(
              child: Text("{User}"),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (err, stack) => Center(
              child: Text(err.toString()),
            ),
          ),
    );
  }
}
