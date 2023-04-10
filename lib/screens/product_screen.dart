import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/providers/providers.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:login_flutter/services/services.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'product';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(
        productService: productService,
      ),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          // hide keyboard when scrolling
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
        onPressed: () {
          // hide the keyboard when button is selected
          FocusScope.of(context).unfocus();
          if (!productForm.isValidForm()) return;

          productService.saveOrCreateProduct(productForm.product);
        },
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
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Producto X',
                  initialValue: product.name,
                  onChange: (value) => product.name = value.toString(),
                  validator: (value) {
                    if (value == null || value.length < 1) {
                      return 'El nombre es obligatorio';
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomInputField(
                  labelText: 'Precio',
                  hintText: '\$150.000',
                  keyboardType: TextInputType.number,
                  maxLine: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?'))
                  ],
                  initialValue: '${product.price}',
                  onChange: (value) {
                    if (int.tryParse(value.toString()) == null) {
                      product.price = 0;
                    } else {
                      product.price = int.parse(value.toString());
                    }
                  },
                  validator: (value) => null),
              const SizedBox(
                height: 20,
              ),
              CustomInputField(
                  labelText: 'Descripción',
                  hintText: 'Producto diseñado para',
                  maxLine: 3,
                  initialValue: product.description,
                  onChange: (value) => product.description = value.toString(),
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'La descripcion es obligatoria';
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile.adaptive(
                  title: const Text('Disponible'),
                  activeColor: AppTheme.primaryColor,
                  value: product.available,
                  // onChanged: (value) {
                  //   product.available = value;
                  //   productForm.notifyListeners();

                  // },
                  onChanged: productForm.updateAvailability),
            ],
          )),
    );
  }
}
