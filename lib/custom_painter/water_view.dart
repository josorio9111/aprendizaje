import 'package:aprendizaje/custom_painter/wave_view.dart';
import 'package:flutter/material.dart';

class WaterView extends StatefulWidget {
  const WaterView({Key? key}) : super(key: key);

  @override
  WaterViewState createState() => WaterViewState();
}

class WaterViewState extends State<WaterView> with TickerProviderStateMixin {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 4, bottom: 3),
                              child: Text(
                                '2100',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                'ml',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: -0.2,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 4, top: 2, bottom: 14),
                          child: Text(
                            'of daily goal 3.5L',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.0,
                              // color: FitnessAppTheme.darkText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 4, right: 4, top: 8, bottom: 16),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.access_time,
                                  color: Colors.grey.withOpacity(0.5),
                                  size: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  'Last drink 8:26 AM',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // fontFamily:
                                    // FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: FlutterLogo(),
                                ),
                                Flexible(
                                  child: Text(
                                    'Your bottle is empty, refill it!.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      // fontFamily:
                                      // FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                      // color: HexColor('#F65283'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blue.withOpacity(0.4),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blue.withOpacity(0.4),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.remove,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
                child: Container(
                  width: 60,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EDFE),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                        topRight: Radius.circular(80.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: const Offset(2, 2),
                          blurRadius: 4),
                    ],
                  ),
                  child: const WaveView(percentageValue: 60.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
