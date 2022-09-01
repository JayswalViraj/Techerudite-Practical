   import 'dart:io';

import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

SnackBar failSnackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Oh no!',
                message:
                    'Please Enter Real Email and Password',
                contentType: ContentType.failure,
              ),
            );

SnackBar successSnackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Good Job...',
                message:
                    'Welcome to My Test App',
                contentType: ContentType.success,
              ),
            );
