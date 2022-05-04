import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage2Widget extends StatefulWidget {
  const Mainpage2Widget({Key key}) : super(key: key);

  @override
  _Mainpage2WidgetState createState() => _Mainpage2WidgetState();
}

class _Mainpage2WidgetState extends State<Mainpage2Widget> {
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
          'INTERN RECORD',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).secondaryText,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.73, -0.94),
                      child: Image.asset(
                        'assets/images/BG1.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.1, -0.86),
                      child: Text(
                        'Time in/ Time Out/ Total Hours',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.75, -1.53),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(30, 100, 30, 220),
                        child: FutureBuilder<ApiCallResponse>(
                          future: TimerecordCall.call(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final listViewTimerecordResponse = snapshot.data;
                            return Builder(
                              builder: (context) {
                                final getime = getJsonField(
                                      (listViewTimerecordResponse?.jsonBody ??
                                          ''),
                                      r'''$[*]''',
                                    )?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: getime.length,
                                  itemBuilder: (context, getimeIndex) {
                                    final getimeItem = getime[getimeIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Container(
                                        height: 200,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0, -0.06),
                                              child: ListTile(
                                                title: Text(
                                                  'Time Out',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                                subtitle: Text(
                                                  getJsonField(
                                                    getimeItem,
                                                    r'''$.t_out''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF303030),
                                                  size: 20,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                              ),
                                            ),
                                            ListTile(
                                              title: Text(
                                                'Time In',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                              subtitle: Text(
                                                getJsonField(
                                                  getimeItem,
                                                  r'''$.t_in''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF303030),
                                                size: 20,
                                              ),
                                              tileColor: Color(0xFFF5F5F5),
                                              dense: false,
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.98),
                                              child: ListTile(
                                                title: Text(
                                                  'Total Hours',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3,
                                                ),
                                                subtitle: Text(
                                                  getJsonField(
                                                    getimeItem,
                                                    r'''$.total_hours''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF303030),
                                                  size: 20,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
