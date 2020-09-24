import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unsplash_test_app/bloc/images_bloc.dart';
import 'package:unsplash_test_app/models/image_models.dart';

class FullImageScreenArgumetns {
  final UnsplashImage image;

  FullImageScreenArgumetns(this.image);
}

class FullImageScreen extends StatefulWidget {
  final FullImageScreenArgumetns argumetns;

  const FullImageScreen(this.argumetns);

  @override
  State<StatefulWidget> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    final imagesBloc = BlocProvider.of<ImagesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text('Image ${widget.argumetns.image.id}'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                imagesBloc.add(
                  LikeImageEvent(widget.argumetns.image.id),
                );
              });
            },
            icon: _buildLikeIcon(imagesBloc, widget.argumetns.image.id),
          )
        ],
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: widget.argumetns.image.urls.regular,
          placeholder: (context, url) => CircularProgressIndicator(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildLikeIcon(ImagesBloc imagesBloc, String id) {
    if (imagesBloc.likedImages.contains(id)) {
      return FaIcon(
        FontAwesomeIcons.solidHeart,
        color: Colors.red,
      );
    } else {
      return FaIcon(FontAwesomeIcons.heart);
    }
  }
}
