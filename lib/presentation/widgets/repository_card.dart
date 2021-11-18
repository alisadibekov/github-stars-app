import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_star_app/data/models/repository_model.dart';
import 'package:github_star_app/foundation/extensions.dart';
import 'package:github_star_app/presentation/widgets/badge_widget.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel repository;

  const RepositoryCard({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String formattedDate = _dateFormat.format(repository.pushedAt);
    // final pushedAgo = DateTime.now().subtract(Duration(days: repos));

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.0),
      margin: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: CupertinoColors.white,
      ),
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 124.0,
              height: 124.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: NetworkImage(repository.photoURL),
                ),
              ),
            ),
            Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repository.name,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(repository.description ?? ''),
                  Row(
                    children: [
                      BadgeWidget(
                        text: repository.stars.toString(),
                        color: CupertinoColors.systemGreen,
                      ),
                      BadgeWidget(
                        text: repository.issues.toString(),
                        color: CupertinoColors.systemRed,
                      ),
                    ],
                  ),
                  Text('Pushed by ' + repository.owner['login']),
                  Text(StringExtension.displayTimeAgoFromTimestamp(
                      repository.pushedAt))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
