import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'endpoint.dart';

abstract class AuhtJwt {

  // Stand for claim jwt
  String encodeJwt(String layanan) {
    final claimSet = JwtClaim(
      defaultIatExp: false,
      otherClaims: <String, dynamic>{"q": layanan, "limit": 30, "offset": 0},
    );
    return issueJwtHS256(claimSet, Endpoint.secretKey);
  }
}
