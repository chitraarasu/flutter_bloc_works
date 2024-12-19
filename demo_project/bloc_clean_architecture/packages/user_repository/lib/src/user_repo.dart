abstract class UserRepository {
  Future<void> signIn(String email);
}

// if sealed class is being it will force to use the subclasses in this same file.
// Syntax:-
// sealed class ClassName {
//
// }