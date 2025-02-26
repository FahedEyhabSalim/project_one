import 'package:flutter/material.dart';
import '../widgets/constrained_box_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 5, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        actions:  [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/search_screen');
          }, icon: Icon(Icons.search_rounded)),

        ],
        title:  Text(
          AppLocalizations.of(context)!.home,
          style: TextStyle(
            color: Color(0xFF474559),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Kinsa',),
            Tab(text: 'Womens',),
            Tab(text: 'Handbags',),
            Tab(text: 'Boots',),
            Tab(text: 'Mens',),
          ],
        ),
      ),
      // ConstrainedBox
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBoxContent(image: 'images/Group 7.png'),

          ],
        ),
      ),
    );
  }
}
