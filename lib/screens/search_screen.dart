import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Search',style: TextStyle(fontSize: 25),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/bottom_navigation_screen');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextField(
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  constraints: const BoxConstraints(
                    maxHeight: 50,
                    minHeight: 50,
                  ),
                  hintText: 'Product Name…',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
          
              GridView.builder(
                // هادي بتخلي الابن ينكمش حسبب محتواي
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,

                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 132 / 170,
                  ),
                  itemBuilder: (contex, index) {
                    return Card(
                      color: Colors.white,
                      child: const Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Spacer(),
                          //     IconButton(onPressed: (){}, icon: Icon(Icons.add))
                          //   ],
                          // ),
                          Image(image: AssetImage('images/image_9.png')),
                          Text('Hand bags',style: TextStyle(fontSize: 20),),
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$10.00',style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
