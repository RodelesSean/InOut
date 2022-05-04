import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadinWidget extends StatefulWidget {
  const LoadinWidget({Key key}) : super(key: key);

  @override
  _LoadinWidgetState createState() => _LoadinWidgetState();
}

class _LoadinWidgetState extends State<LoadinWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 3000,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 3000,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarPage(initialPage: 'MAINPAGE'),
        ),
      );
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/BG1.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: AlignmentDirectional(0.1, -0.63),
                  child: Image.asset(
                    'assets/images/AHG_Lab_Elements-53.png',
                    width: 200,
                    fit: BoxFit.cover,
                  ).animated([animationsMap['imageOnPageLoadAnimation1']]),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.16),
                  child: Image.asset(
                    'assets/images/AHG_Lab_Logo_white.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ).animated([animationsMap['imageOnPageLoadAnimation2']]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
