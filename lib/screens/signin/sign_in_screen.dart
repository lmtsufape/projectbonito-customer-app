import 'package:ecommercebonito/screens/screens_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommercebonito/components/buttons/custom_text_button.dart';
import 'package:ecommercebonito/components/buttons/primary_button.dart';
import 'package:ecommercebonito/components/forms/custom_text_form_field.dart';
import 'package:ecommercebonito/components/utils/vertical_spacer_box.dart';
import 'package:ecommercebonito/screens/signin/sign_in_controller.dart';
import 'package:ecommercebonito/shared/constants/app_number_constants.dart';
import 'package:ecommercebonito/shared/constants/style_constants.dart';
import '../../shared/constants/app_enums.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**Declare this variable to get the Media Query of the screen in the current context */
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController()),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(250),
                child: AppBar(
                  title: const Center(
                    child: Text(
                      'Bem-vindo(a) ao App Bonito',
                      style: kTitle1,
                    ),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  backgroundColor: kDetailColor,
                ),
              ),
              body: Container(
                width: size.width,
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Center(
                        child: Text(
                      'Entrar',
                      style: kTitle2,
                      selectionColor: kSecondaryColor,
                    )),
                    const Spacer(),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'E-mail',
                      controller: controller.emailController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'Senha',
                      isPassword: true,
                      controller: controller.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          title: 'Esqueceu a senha?',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Entrar',
                            onPressed: () => controller.signIn(context)),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          controller.errorMessage != null
                              ? Text(
                                  controller.errorMessage!,
                                  style: kCaption1,
                                )
                              : const SizedBox(),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui conta?'),
                              CustomTextButton(
                                title: 'Crie aqui',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Screens.register);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
