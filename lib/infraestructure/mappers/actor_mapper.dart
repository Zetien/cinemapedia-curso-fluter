import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => 
  Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null 
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://t4.ftcdn.net/jpg/01/86/29/31/360_F_186293166_P4yk3uXQBDapbDFlR17ivpM6B1ux0fHG.jpg',
    character: cast.character
  );
}
