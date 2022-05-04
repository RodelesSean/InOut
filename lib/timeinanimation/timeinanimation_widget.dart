import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeinanimationWidget extends StatefulWidget {
  const TimeinanimationWidget({Key key}) : super(key: key);

  @override
  _TimeinanimationWidgetState createState() => _TimeinanimationWidgetState();
}

class _TimeinanimationWidgetState extends State<TimeinanimationWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
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
    'textOnPageLoadAnimation2': AnimationInfo(
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
                  alignment: AlignmentDirectional(-0.02, 0.19),
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetnameCall.call(
                      authToken: FFAppState().Authorization,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final textGetnameResponse = snapshot.data;
                      return Text(
                        getJsonField(
                          (textGetnameResponse?.jsonBody ?? ''),
                          r'''$[:1].name''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              fontSize: 30,
                            ),
                      ).animated([animationsMap['textOnPageLoadAnimation1']]);
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, -0.25),
                  child: Text(
                    'You Have \nSuccessfully \nTimed in',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                  ).animated([animationsMap['textOnPageLoadAnimation2']]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
