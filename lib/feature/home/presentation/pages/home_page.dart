import 'package:clean_architure/core/common/widgets/loader.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/bloc.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/event.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<HomeBloc>().add(
        HomeFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is HomeLoading){
            return Loader();
          }
          if(state is HomeDataSuccess){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: state.homeDataModel.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  return Container(

                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: AppPallete.gradient3
                    ),
                    child: Column(
                      children: [
                        Text(state.homeDataModel[index].title.toString(),

                          style: TextStyle(color: AppPallete.gradient1),
                        ),


                      ],
                    ),
                  );
                });
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
