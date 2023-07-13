class Follow {
  int followingCount;
  int followersCount;
  List<String> following;
  List<String> followers;

  Follow(
      {required this.followingCount,
      required this.followersCount,
      required this.following,
      required this.followers});

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      followingCount: json['following_count'],
      followersCount: json['followers_count'],
      following: List<String>.from(json['following']),
      followers: List<String>.from(json['followers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'following_count': followingCount,
      'followers_count': followersCount,
      'following': following,
      'followers': followers,
    };
  }
}
