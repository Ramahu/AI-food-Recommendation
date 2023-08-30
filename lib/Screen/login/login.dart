import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screen/Layout/layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/repository.dart';
import '../register/register.dart';
import 'bloc/login_bloc.dart';

class LoginScreeen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return LoginBloc(
            repository: Repository(),
          );
        },
        child: BlocConsumer<LoginBloc, LoginStates>(listener: (context, state) {
          if (state is Authenticated) {
            CacheHelper.saveData(
                key: "name", value: state.loginModel?.user?.name.toString());
            CacheHelper.saveData(
                key: "email", value: state.loginModel?.user?.email.toString());
            CacheHelper.saveData(key: 'token', value: state.loginModel!.token)
                .then((value) {
              navigateAndFinish(context, Layout());
            });
          }
          if (state is AuthError) {}
        }, builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              //height: 260,
              decoration: const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('assets/images/logo2.png'),
                  alignment: Alignment.topCenter,
                  scale: 2.5,
                  // fit: BoxFit.fitWidth,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [defaultNavyBlue, defaultPurple],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(100, 90)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(
                                  context,
                                  Layout(),
                                );
                              },
                              child: Text(
                                '      Skip',
                                style: GoogleFonts.abel(
                                  textStyle: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                colors: [defaultNavyBlue, defaultPurple],
                              ).createShader(rect),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: GoogleFonts.signikaNegative(
                                    textStyle: const TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            defaultTextForm(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              autofillHints: [AutofillHints.email],
                              label: 'Email Address',
                              labelStyle: const TextStyle(
                                color: grey,
                              ),
                              prefix: const Icon(
                                Icons.mail_outline_outlined,
                                color: defaultPurple,
                              ),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email address';
                                }
                                return null;
                              },
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                              enableBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            defaultTextForm(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'Password',
                              labelStyle: const TextStyle(
                                color: grey,
                              ),
                              prefix: const Icon(
                                Icons.key_outlined,
                                color: defaultPurple,
                              ),
                              suffix:
                                  BlocProvider.of<LoginBloc>(context).suffix,
                              suffixPressed: () {
                                BlocProvider.of<LoginBloc>(context).add(
                                  PasswordVisibility(),
                                );
                              },
                              isPassword: BlocProvider.of<LoginBloc>(context)
                                  .isPassword,
                              maxLines: 1,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              autofillHints: [AutofillHints.password],
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                              enableBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(
                                  color: defaultPurple,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Center(
                              child: defaultGradientBottom(
                                  text: ' Log In',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 50.0,
                                  color1: defaultNavyBlue,
                                  color2: defaultPurple,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginRequested(emailController.text,
                                            passwordController.text),
                                      );
                                    }
                                  }),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const SizedBox(width: 20.0,),
                                Text(
                                  'Don\'t have an account ?',
                                  style: GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      RegisterScreeen(),
                                    );
                                  },
                                  child: Text(
                                    'Create',
                                    style: GoogleFonts.abel(
                                      textStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                //const SizedBox(width: 10.0,),
                              ],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
