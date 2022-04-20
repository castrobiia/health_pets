import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MetaGasto extends StatefulWidget {
  @override
  _MetaGastoState createState() => _MetaGastoState();
}

class _MetaGastoState extends State<MetaGasto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(15.0),
              
//               child: new LinearPercentIndicator(
//                 width: MediaQuery.of(context).size.width - 50,
//                 animation: true,
//                 lineHeight: 20.0,
//                 animationDuration: 2500,
//                 percent: 0.8,
//                 center: Text("80.0%"),
//                 linearStrokeCap: LinearStrokeCap.roundAll,
//                 progressColor: Colors.green,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  "Estimativa dos gastos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24.0),
                _metaLinear(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Card _metaLinear(context) {
  return Card(
    child: LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 43,
      lineHeight: 30,
      percent: 0.75,
      center: Text(
        'R\$200',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: ColorTheme.rosa3,
      //backgroundColor: Colors.indigo,
      animation: true,
      animationDuration: 2500,
    ),
  );
}
