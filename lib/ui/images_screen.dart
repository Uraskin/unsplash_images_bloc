import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unsplash_test_app/bloc/images_bloc.dart';
import 'package:unsplash_test_app/models/image_models.dart';
import 'package:unsplash_test_app/ui/full_image_screen.dart';

class ImagesScreen extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash images'),
      ),
      body: BlocConsumer(
        bloc: BlocProvider.of<ImagesBloc>(context)..add(FetchImagesEvent()),
        listener: (context, state) => _onNewState(context, state),
        builder: (context, state) => _buildState(context, state),
      ),
    );
  }

  bool _handleScrollNotification(context, ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      BlocProvider.of<ImagesBloc>(context).add(FetchImagesNextPageEvent());
    }

    return false;
  }

  _onNewState(context, state) {
    

  }

  _buildState(context, state) {
    if (state is LoadingImagesState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorImagesState) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Error: ${state.error}',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state is IdleImagesState) {
      final images = state.images;

      if (images == null || images.isEmpty) {
        return Center(
          child: Text(
            'Empty',
          ),
        );
      }

      return NotificationListener<ScrollNotification>(
        onNotification: (notification) =>
            _handleScrollNotification(context, notification),
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: images.length + 1,
          itemBuilder: (_, index) {
            return index >= images.length
                ? _buildItemLoader()
                : _buildImageItem(context, images[index]);
          },
        ),
      );
    }

    return Container();
  }

  _buildItemLoader() {
     return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CircularProgressIndicator(),
        ),
      );
  }

  _buildImageItem(context, UnsplashImage item) {
    final imagesBloc = BlocProvider.of<ImagesBloc>(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            'fullImage',
            arguments: FullImageScreenArgumetns(item),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            height: 250,
            width: double.infinity,
            imageUrl: item.urls.small,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(.1),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: () => imagesBloc.add(
                  LikeImageEvent(item.id),
                ),
                icon: _buildLikeIcon(imagesBloc, item.id),
              ),
              Text(item.id)
            ],
          ),
        ),
      ],
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
