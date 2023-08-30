import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screen/Layout/layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/repository.dart';
import '../login/login.dart';
import 'bloc/register_bloc.dart';

class RegisterScreeen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var key = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  List<String> options = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return RegisterBloc(
            repository: Repository(),
          );
        },
        child: BlocConsumer<RegisterBloc, RegisterStates>(
            listener: (context, state) {
          if (state is Authenticated) {
            CacheHelper.saveData(
                    key: 'token', value: state.registerModel?.token)
                .then((value) {
              navigateAndFinish(context, Layout());
            });

            if (state.registerModel?.token != null) {
              CacheHelper.saveData(
                      key: 'token', value: state.registerModel?.token)
                  .then((value) {
                navigateAndFinish(context, Layout());
              });
            }

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
                    // child:  Center(
                    //   child: Text('  Create Account',
                    //     style: GoogleFonts.cookie(
                    //       textStyle: const TextStyle(
                    //         fontSize: 40.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                            const SizedBox(
                              height: 40.0,
                            ),
                            ShaderMask(
                              shaderCallback: (rect) => const LinearGradient(
                                colors: [defaultNavyBlue, defaultPurple],
                              ).createShader(rect),
                              child: Center(
                                child: Text(
                                  'Create Account',
                                  style: GoogleFonts.signikaNegative(
                                    textStyle: const TextStyle(
                                      fontSize: 25.0,
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
                              controller: nameController,
                              type: TextInputType.text,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              label: 'Name',
                              labelStyle: const TextStyle(
                                color: grey,
                              ),
                              prefix: const Icon(
                                Icons.person_outline,
                                color: defaultPurple,
                              ),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
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
                              height: 15.0,
                            ),
                            defaultTextForm(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              height: 15.0,
                            ),
                            // defaultTextForm(
                            // controller:phoneController,
                            // type: TextInputType.number,
                            // autoValidateMode: AutovalidateMode.onUserInteraction,
                            // label: 'Phone Number',
                            // labelStyle: const TextStyle(color:grey,),
                            // prefix: const Icon(Icons.phone_android_outlined,
                            // color: defaultPurple,),
                            // validate: (value){
                            // if(value!.isEmpty){
                            // return 'Please enter phone number' ;
                            // }
                            // return null;
                            // },
                            // border: const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color: defaultPurple,),
                            // ),
                            // focusedBorder:const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color: defaultPurple,),
                            // ),
                            // enableBorder:const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color: defaultPurple,),
                            // ),
                            // ),
                            //const SizedBox(height: 15.0,),
                            // const Text("Enter your gender"),
                            // Row(
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text("Female"),
                            //     Radio(
                            //         value: true,
                            //         groupValue:  BlocProvider.of<RegisterBloc>(context).isFemale,
                            //         onChanged: (v) {
                            //           BlocProvider.of<RegisterBloc>(context).add(GenderEvent());
                            //           print(BlocProvider.of<RegisterBloc>(context).isFemale);
                            //         }),
                            //   ],
                            // ),
                            defaultDropdown(
                              items: options.map(buildGenderItem).toList(),
                              onChange: (value) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .selectedOption = value.toString();
                                print(BlocProvider.of<RegisterBloc>(context)
                                    .selectedOption);
                              },
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please choose an item';
                                }
                                return null;
                              },
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hint: const Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: grey,
                                ),
                              ),
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
                              prefix: const Icon(
                                Icons.person_2_outlined,
                                color: defaultPurple,
                              ),
                            ),

                            const SizedBox(
                              height: 15.0,
                            ),
                            defaultTextForm(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'Password',
                              labelStyle: const TextStyle(
                                color: grey,
                              ),
                              maxLines: 1,
                              prefix: const Icon(
                                Icons.key_outlined,
                                color: defaultPurple,
                              ),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                if (value.length < 8) {
                                  return 'Short password';
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
                            //const SizedBox(height: 15.0,),
                            // defaultTextForm(
                            // controller:confirmPassController,
                            // type: TextInputType.visiblePassword,
                            // label: 'Confirm Password',
                            // labelStyle: const TextStyle(color:grey,),
                            // maxLines: 1,
                            // prefix: const Icon(Icons.key_outlined,
                            // color: defaultPurple,),
                            // autoValidateMode: AutovalidateMode.onUserInteraction,
                            // validate: (value){
                            // if(value!.isEmpty){
                            // return 'Please enter confirm password' ;
                            // }
                            // if(passwordController.value.text != value){
                            // return 'Mast match' ;
                            // }
                            // return null;
                            // },
                            // border: const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color:defaultPurple,),
                            // ),
                            // focusedBorder:const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color: defaultPurple,),
                            // ),
                            // enableBorder:const OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(25)),
                            // borderSide: BorderSide(color: defaultPurple,),
                            // ),
                            // ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Center(
                              child: defaultGradientBottom(
                                  text: 'Register',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 50.0,
                                  color1: defaultNavyBlue,
                                  color2: defaultPurple,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(
                                        RegisterRequested(
                                          emailController.text,
                                          passwordController.text,
                                          nameController.text,
                                          BlocProvider.of<RegisterBloc>(context)
                                              .selectedOption,
                                        ),
                                      );
                                    }
                                  }),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?',
                                  style: GoogleFonts.signikaNegative(
                                    textStyle: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      LoginScreeen(),
                                    );
                                  },
                                  child: Text(
                                    'Log In',
                                    style: GoogleFonts.abel(
                                      textStyle: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
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

  DropdownMenuItem<String> buildGenderItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      );
}
