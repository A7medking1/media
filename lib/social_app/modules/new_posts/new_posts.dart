import 'package:flutter/material.dart';
import 'package:media/social_app/shared/component/components.dart';

class NewPostsScreen extends StatelessWidget {
  const NewPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Add Posts',
      ),
      body: const Text(
        'posts',
      ),
    );
  }


}
