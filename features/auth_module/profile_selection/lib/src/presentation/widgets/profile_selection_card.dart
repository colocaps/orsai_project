import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileSelectionCard extends StatelessWidget {
  final ProfileSelectionEntity profileSelectionEntity;
  final void Function()? onTap;

  const ProfileSelectionCard({
    Key? key,
    required this.profileSelectionEntity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.blueAccent,
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 110,
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage(
                    'assets/images/no-image.jpg',
                    package: 'core',
                  ),
                  image: NetworkImage(
                    profileSelectionEntity.imagePath,
                  ),
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                profileSelectionEntity.profileName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}