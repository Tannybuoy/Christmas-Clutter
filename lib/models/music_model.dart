class MusicModel {
  final int id;
  final String title;
  final String artist;
  final double duration;

  MusicModel({this.id, this.title, this.artist, this.duration});

  static List<MusicModel> list = [
    MusicModel(
      id: 1,
      title: "All I Want for Christmas Is You",
      artist: "Mariah Carey",
      duration: 60,
    ),
    MusicModel(
      id: 2,
      title: "Last Christmas",
      artist: "Wham!",
      duration: 60,
    ),
    MusicModel(
      id: 3,
      title: "I Saw Mommy Kissing Santa Claus",
      artist: "Jackson 5",
      duration: 60,
    ),
    MusicModel(
      id: 4,
      title: "Rudolph the Red-Nosed Reindeer",
      artist: "Harry Connick",
      duration: 60,
    ),
    MusicModel(
      id: 5,
      title: "It's Beginning to Look a Lot Like Christmas",
      artist: "Michael Bublé",
      duration: 60,
    ),
    MusicModel(
      id: 6,
      title: "Please Come Home For Christmas",
      artist: "Jon Bon Jovi",
      duration: 60,
    ),
    MusicModel(
      id: 7,
      title: "Home For the Holidays",
      artist: "The Carpenters",
      duration: 60,
    )
  ];
}