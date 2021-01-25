
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/core/providers/dogs_provider.dart';
import 'package:flutter_dogapp/ui/widgets/custom_containers.dart';
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
      create:(_) => DogsProvider(context),
      child: Consumer<DogsProvider>(
      builder: (context, provider, child) {
        if (isScrollListenerAttach == false) {
          // add listener callback when user scroll at the bottom of the list to load more breeds
          listController.addListener(() {
            if (listController.position.pixels == listController.position.maxScrollExtent) {
              provider.getMoreBreeds();
            }
          });
          isScrollListenerAttach = true;
        }
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: provider.loading == true ? showLoading()
          : SafeArea(
            child: Column(
              children: [
                customContainer(Text('Breeds list', style: TextStyle(color: Colors.black, fontSize: 18),), true, true),
                Expanded(
                  child: ListView.builder(
                    controller: listController,
                    itemCount: provider.cards.length + 1,
                    itemBuilder: (context, index) {
                      // use to inform the user that the list is loading
                      if (index == provider.cards.length) {
                        return provider.noMoreData == true ? Container() : Center(child: CircularProgressIndicator());
                      } else {
                        return provider.cards[index];
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
        }
      ),
    );
  }
}
