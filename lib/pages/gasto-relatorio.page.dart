// import 'package:flutter/material.dart';

// import '../models/relatorio-model.dart';
// import '../themes/color_theme.dart';
// import '../widgets/lista_gastos.widget.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class RelatoriosGastos extends StatefulWidget {
//   const RelatoriosGastos({Key? key}) : super(key: key);

//   @override
//   State<RelatoriosGastos> createState() => _RelatoriosGastosState();
// }

// class _RelatoriosGastosState extends State<RelatoriosGastos> {
//   int filterHistory = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 8.0),
//                 Text(
//                   AppLocalizations.of(context)!.expensesPets,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 24.0),
//                 _buildIncome(),
//                 const SizedBox(height: 24.0),
//                 _buildExpenses(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Card _buildIncome() {
//     return Card(
//       child: ExpansionTile(
//         tilePadding: const EdgeInsets.symmetric(
//           vertical: 8.0,
//           horizontal: 16.0,
//         ),
//         title: const Text(
//           'Pet1',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         leading: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: ColorTheme.salmao2,
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: const Center(
//             child: Icon(
//               Icons.pets,
//               color: Colors.white,
//               size: 36,
//             ),
//           ),
//         ),
//         children: [
//           Column(
//             children: incomeTransaction
//                 .map(
//                   (e) => Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8.0,
//                       horizontal: 16.0,
//                     ),
//                     child: ListaGastos(
//                       transaction: e,
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Card _buildExpenses() {
//     return Card(
//       child: ExpansionTile(
//         tilePadding: const EdgeInsets.symmetric(
//           vertical: 8.0,
//           horizontal: 16.0,
//         ),
//         title: const Text(
//           'Pet2',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         leading: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: ColorTheme.salmao2,
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: const Center(
//             child: Icon(
//               Icons.pets,
//               color: Colors.white,
//               size: 36,
//             ),
//           ),
//         ),
//         children: [
//           Column(
//             children: expensesTransaction
//                 .map(
//                   (e) => Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8.0,
//                       horizontal: 16.0,
//                     ),
//                     child: ListaGastos(
//                       transaction: e,
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
