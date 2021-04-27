import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/search/search_bloc.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/screens/locations/widgets/location_item.dart';

class LocationItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchUpdatedSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: textPadding,
                  right: textPadding,
                  bottom: textPadding,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.search.locations.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: index == state.search.locations.length - 1 ? 10 : 0),
                          child: LocationItem(
                            state: state,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
