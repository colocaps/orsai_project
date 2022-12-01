import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.99,
      width: MediaQuery.of(context).size.width * 0.99,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/no-image.jpg',
            package: 'core',
          ),
          fit: BoxFit.none,
          opacity: 1.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 4,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36.0),
          child: CustomLoadingIndicator(
            customIndicatorImage: Image.asset(
              'assets/images/no-image.jpg',
              package: 'core',
            ),
          ),
        ),
      ),
    );
  }
}
