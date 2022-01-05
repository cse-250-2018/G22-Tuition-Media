import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Write Post',
                      // hintTextDirection:
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Post'),
                ),
              ],
            ),
          ),
        ));

    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Column(
    //     children: [
    //       TextFormField(
    //         textInputAction: TextInputAction.done,
    //         keyboardType: TextInputType.text,
    //         decoration: const InputDecoration(
    //           hintText: 'Write Post',
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
