import 'package:flutter/material.dart';


class ConstrainedBoxContent extends StatelessWidget {
  const ConstrainedBoxContent({
    required this.image,

    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 190),
        child: PageView.builder(itemBuilder: (context,index){
          return Card(
            color: Colors.white,
            margin: const EdgeInsetsDirectional.only(end: 20,start: 20),
            // color: index % 2== 0 ? Colors.black38 :Colors.yellow.shade200,
            child: Image.asset('images/Group 7.png'),

          );
        }),

      ),
        const SizedBox(height: 10,),
        GridView.builder(
          // هادي بتخلي الابن ينكمش حسبب محتواي
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              childAspectRatio: 132 / 170,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (contex, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/product_details_screen');


                },
                child: Card(
                  color: Colors.white,
                  child:  Column(
                    children: [

                      Row(
                        children: [
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.grey,))
                        ],
                      ),
                      Image(image: AssetImage('images/image_9.png')),
                      Text('Hand bags'),
                      SizedBox(height: 5,),
                      Text('\$ 10.00'),

                    ],

                  ),
                  elevation:0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );

            }),
      ],
    );

  }
}
