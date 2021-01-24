
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dogapp/core/bloc/dogs/dogs_bloc.dart';
import 'package:flutter_dogapp/core/bloc/dogs/dogs_bloc_event.dart';
import 'package:flutter_dogapp/core/bloc/dogs/dogs_bloc_state.dart';
import 'package:flutter_dogapp/ui/widgets/custom_containers.dart';
import 'package:flutter_dogapp/ui/widgets/errors_dialog.dart';

class BreedsPage extends StatefulWidget {
  BreedsPage({Key key}) : super(key: key);

  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> with AutomaticKeepAliveClientMixin {

  DogsBloc dogsBloc;
  ScrollController listController = ScrollController();
  bool isScrollListenerAttach = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    dogsBloc = DogsBloc();
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
    return BlocBuilder<DogsBloc, DogsBlocState>(
      cubit: dogsBloc,
      builder: (context, state,) {
        if (state is DogsError) {
          SchedulerBinding.instance.addPostFrameCallback((_) =>
              showErrorDialog(context, state.error));
        }

        if (isScrollListenerAttach == false) {
          // send event to load breeds list
          dogsBloc.add(DogsLoadBreeds());
          // add listener callback when user scroll at the bottom of the list to load more breeds
          listController.addListener(() {
            if (listController.position.pixels == listController.position.maxScrollExtent) {
              dogsBloc.add(DogsLoadMoreBreeds());
            }
          });
          isScrollListenerAttach = true;
        }
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: state is DogsLoading ? showLoading()
              : SafeArea(
            child: Column(
              children: [
                customContainer(Text('Breeds list', style: TextStyle(color: Colors.black, fontSize: 18),), true, true),
                Expanded(
                  child: ListView.builder(
                    controller: listController,
                    itemCount: dogsBloc.cards.length + 1,
                    itemBuilder: (context, index) {
                      // use to inform the user that the list is loading
                      if (index == dogsBloc.cards.length) {
                        return state is DogsNoMoreData ? Container() : Center(child: CircularProgressIndicator());
                      } else {
                        return dogsBloc.cards[index];
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}