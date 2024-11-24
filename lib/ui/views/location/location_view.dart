import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oz_cafe/ui/common/app_colors.dart';
import 'package:oz_cafe/ui/common/text_style.dart';
import 'package:stacked/stacked.dart';

import 'location_viewmodel.dart';

class LocationView extends StackedView<LocationViewModel> {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LocationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text('Map View',style: FontStyles.header3,)),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(viewModel.latitude, viewModel.longitude),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId('pin'),
            position: LatLng(viewModel.latitude, viewModel.longitude),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcEazyBlueColor,
        onPressed: () {
          viewModel.openMap();
        },
        child: const Icon(Icons.directions,color: kcVintageCreamColor,),
      ),
    );
  }

  @override
  LocationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LocationViewModel();
}
