import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:login_flutter/services/services.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'product';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
          child: Column(
        children: [
          Stack(
            children: [
              ProductImage(productService.selectedProduct.picture),
              Positioned(
                  top: 60,
                  left: 0,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      // TODO: camara
                    },
                    icon: const Center(
                        child: Icon(
                      Icons.photo_camera_rounded,
                      color: Colors.white,
                      size: 40,
                    )),
                  )),
            ],
          ),
          const _ProductForm(),
          const SizedBox(
            height: 100,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print,
        child: const Icon(Icons.save_rounded),
        backgroundColor: AppTheme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Form(
          child: Column(
        children: [
          CustomInputField(
              labelText: 'Nombre',
              hintText: 'Producto X',
              onChange: (value) => print,
              validator: (value) => null),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
              labelText: 'Precio',
              hintText: '\$150.000',
              keyboardType: TextInputType.number,
              onChange: (value) => print,
              validator: (value) => null),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
              labelText: 'Descripción',
              hintText: 'Producto diseñado para',
              maxLine: 3,
              onChange: (value) => print,
              validator: (value) => null),
          const SizedBox(
            height: 20,
          ),
          SwitchListTile.adaptive(
              title: const Text('Disponible'),
              activeColor: AppTheme.primaryColor,
              value: true,
              onChanged: (value) => print),
        ],
      )),
    );
  }
}
