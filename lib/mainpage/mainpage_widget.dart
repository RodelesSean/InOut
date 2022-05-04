import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../sendcsv/sendcsv_widget.dart';
import '../timein/timein_widget.dart';
import '../timeout/timeout_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainpageWidget extends StatefulWidget {
  const MainpageWidget({Key key}) : super(key: key);

  @override
  _MainpageWidgetState createState() => _MainpageWidgetState();
}

class _MainpageWidgetState extends State<MainpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.logout,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            await signOut();
            setState(() => FFAppState().Authorization = '');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageWidget(),
              ),
            );
          },
        ),
        title: Text(
          'INTERN TIME IN/OUT',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF3B3939),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/BG1.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.02, -0.82),
                child: Image.asset(
                  'assets/images/AHGAHG_prev_ui.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.05, -0.48),
                child: Text(
                  'Welcome',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.01, -0.21),
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
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, 0.13),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeinWidget(),
                      ),
                    );
                  },
                  text: 'TIME IN',
                  options: FFButtonOptions(
                    width: 300,
                    height: 40,
                    color: Color(0xFF3B3939),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.44),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeoutWidget(),
                      ),
                    );
                  },
                  text: 'TIME OUT',
                  options: FFButtonOptions(
                    width: 300,
                    height: 40,
                    color: Color(0xFF3B3939),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.96, 0.95),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendcsvWidget(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.share,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
