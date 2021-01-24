
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/core/models/dogs_model.dart';
import 'package:provider/provider.dart';

class BreedsPage extends StatefulWidget {
  BreedsPage({Key key}) : super(key: key);

  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> with AutomaticKeepAliveClientMixin {

  ScrollController listController = ScrollController();
  bool isScrollListenerAttach = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  Widget showLoading() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Loading...', style: TextStyle(color: Colors.grey),)
          ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create:(_) => DogsModel(context),
      child: Consumer<DogsModel>(
      builder: (context, model, child) {
        if (isScrollListenerAttach == false) {
          listController.addListener(() {
            if (listController.position.pixels == listController.position.maxScrollExtent) {
              model.getMoreBreeds();
            }
          });
          isScrollListenerAttach = true;
        }
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: model.loading == true ? showLoading()
          : ListView.builder(
            controller: listController,
            itemCount: model.cards.length + 1,
            itemBuilder: (context, index) {
              if (index == model.cards.length) {
                return model.noMoreData == true ? Container() : Center(child: CircularProgressIndicator());
              } else {
                return model.cards[index];
              }
            },
          ),
        );
        }
      ),
    );
  }
}
